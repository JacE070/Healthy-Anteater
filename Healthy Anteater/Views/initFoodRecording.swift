//
//  initFoodRecording.swift
//  Healthy Anteater
//
//  Created by Haoran Li on 2/26/23.
//

import Foundation
import SwiftUI

struct initWeight: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var gender = "Required"
    let genders = ["Required", "Male", "Female"]
    @State private var age: Int? = nil
    @State private var weight: Double? = nil
    @State private var height: Double? = nil
    @State private var showErrorMessage = false
    @State var islogged = false
    var body: some View{
        if islogged{
            initTarget()
        }
        else{
            content
        }
    }
    var content: some View {
            VStack(alignment:.center){
                VStack(alignment: .leading){
                    Image("image_placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(70.0)
                    Text("Hi Anteater,")
                        .fontWeight(.heavy)
                        .font(.headline)
                    Text("Let's get to know you better")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                        .padding(.bottom, 30.0)
                    Text("Please select your gender:")
                    Picker("Gender", selection: $gender){
                        ForEach(genders, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.menu)
                    Group{
                        Text("Please enter your age:")
                        TextField("Required", value: $age, format: .number)
                            .padding(.bottom, 10)
                    }
                    Group{
                        Text("Please enter your height in cm:")
                        TextField("Required", value: $height, format: .number)
                            .padding(.bottom, 10)
                    }
                    Group{
                        Text("Please enter your weight in kg:")
                        TextField("Required", value: $weight, format: .number)
                            .padding(.bottom, 10)
                    }
                    
                }.padding(.bottom, 50)
                
                Spacer()
                Button("Submit") {
                    if (Manager.checkUpdateWeight(gender: gender, age: age, weight: weight, height: height)){
                        // Update
                        // Go back
                        islogged = true
                    } else {
                        showErrorMessage = true
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .buttonStyle(.borderedProminent)
                    .controlSize(.large)
            }
            .padding(.horizontal, 35.0)
            .alert(isPresented: $showErrorMessage){
                () -> Alert in
                Alert(title: Text("Invalid Data. Please check!"))
            }
            
        
    }
}


struct initTarget: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var target_weight: Double? = nil
    @State private var showErrorMessage = false
    @State var islogged = false
    var body: some View{
        if islogged{
            initFoodRecording()
        }
        else{
            content
        }
    }
    var content: some View {
        VStack(alignment:.center){
            VStack(alignment: .leading){
                Image("image_placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(70.0)
                Text("Hi Anteater,")
                    .fontWeight(.heavy)
                    .font(.headline)
                Text("Let's get to know you better")
                    .font(.subheadline)
                    .fontWeight(.heavy)
                    .padding(.bottom, 30.0)
                Group{
                    Text("Please enter your weight in kg:")
                    TextField("Required", value: $target_weight, format: .number)
                        .padding(.bottom, 10)
                }
                
            }.padding(.bottom, 50)
            
            Spacer()
            Button("Submit") {
                if target_weight != nil && target_weight! > 0{
                    // Update
                    // Go back
                    islogged = true
                } else {
                    showErrorMessage = true
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .buttonStyle(.borderedProminent)
                .controlSize(.large)
        }
        .padding(.horizontal, 35.0)
        .alert(isPresented: $showErrorMessage){
            () -> Alert in
            Alert(title: Text("Invalid Data. Please check!"))
        }
    }
}


struct initFoodRecording: View {
    @State private var breakfast = false
    @State private var lunch = false
    @State private var dinner = false
    @State private var dislike = ""
    @State private var allergies = ""
    var body: some View {
        NavigationView{
        
            ZStack{
                Color(UIColor(red: 0.783, green: 0.906, blue: 0.958, alpha: 1))
                .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Image("undraw_voting_nvu7")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(70.0)
                        
                        Text("Hi Anteater, ")
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("Let’s get start with your app. ")
                            .font(.subheadline)
                            .fontWeight(.heavy)
                        Group{
                            Text("Recommendation includes:")
                                .font(.body)
                                .padding(.top, 20)
                        }
                        
                        HStack(){
                            Text("breakfast")
                            
                            Spacer()
                            Button(action:{
                                if(self.breakfast == false){
                                    self.breakfast = true
                                }
                                else{
                                    self.breakfast = false
                                }
                            }, label:{
                                Image(self.breakfast == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                            
                        }
                        HStack(){
                            
                            Text("lunch")
                            Spacer()
                            Button(action:{
                                if(self.lunch == false){
                                    self.lunch = true
                                }
                                else{
                                    self.lunch = false
                                }
                            }, label:{
                                Image(self.lunch == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                            
                        }
                        HStack(){
                            Text("dinner")
                            
                            Spacer()
                            Button(action:{
                                if(self.dinner == false){
                                    self.dinner = true
                                }
                                else{
                                    self.dinner = false
                                }
                            }, label:{
                                Image(self.dinner == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                        }
                    }
                    Spacer()
                    NavigationLink(destination: InitDislikeFood(), label:{
                       Text("Next")
                    })
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .onSubmit {
                        print(breakfast)
                        print(lunch)
                        print(dinner)
                        print(dislike)
                        print(allergies)
                    }
                }
                .padding(.horizontal, 35.0)
            }
        }
    }
}


struct InitDislikeFood: View {

    @State private var Marzipan = false
    @State private var Olives = false
    @State private var Onions = false
    @State private var Sushi = false
    @State private var Broccoli  = false
    @State private var Tofu  = false
    @State private var Fish  = false
    @State private var Liver  = false
    @State private var Oysters  = false
    
    var body: some View {
        
            ZStack{
                Color(UIColor(red: 0.783, green: 0.906, blue: 0.958, alpha: 1))
                .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    VStack(alignment: .leading) {
         
                        
                        Text("Hi Anteater, ")
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("Let’s get to know you better. ")
                            .font(.subheadline)
                            .fontWeight(.heavy)
                        Group{
                            Text("Select your dislike food:")
                                .font(.body)
                                .padding(.top, 20)
                        }
                        
                        HStack(){
                            Text("Marzipan")
                            
                            Spacer()
                            Button(action:{
                                if(self.Marzipan == false){
                                    self.Marzipan = true
                                }
                                else{
                                    self.Marzipan = false
                                }
                            }, label:{
                                Image(self.Marzipan == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                            
                        }
                        HStack(){
                            
                            Text("Olives")
                            Spacer()
                            Button(action:{
                                if(self.Olives == false){
                                    self.Olives = true
                                }
                                else{
                                    self.Olives = false
                                }
                            }, label:{
                                Image(self.Olives == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                            
                        }
                        HStack(){
                            Text("Onions")
                            
                            Spacer()
                            Button(action:{
                                if(self.Onions == false){
                                    self.Onions = true
                                }
                                else{
                                    self.Onions = false
                                }
                            }, label:{
                                Image(self.Onions == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                        }
                        HStack(){
                            Text("Sushi")
                            
                            Spacer()
                            Button(action:{
                                if(self.Sushi == false){
                                    self.Sushi = true
                                }
                                else{
                                    self.Sushi = false
                                }
                            }, label:{
                                Image(self.Sushi == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                        }
                        HStack(){
                            Text("Broccoli")
                            
                            Spacer()
                            Button(action:{
                                if(self.Broccoli == false){
                                    self.Broccoli = true
                                }
                                else{
                                    self.Broccoli = false
                                }
                            }, label:{
                                Image(self.Broccoli == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                        }
                        HStack(){
                            Text("Tofu")
                            
                            Spacer()
                            Button(action:{
                                if(self.Tofu == false){
                                    self.Tofu = true
                                }
                                else{
                                    self.Tofu = false
                                }
                            }, label:{
                                Image(self.Tofu == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                        }
                        HStack(){
                            Text("Fish")
                            
                            Spacer()
                            Button(action:{
                                if(self.Fish == false){
                                    self.Fish = true
                                }
                                else{
                                    self.Fish = false
                                }
                            }, label:{
                                Image(self.Fish == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                        }
       
                    }
                    HStack(){
                        Text("Liver")
                        
                        Spacer()
                        Button(action:{
                            if(self.Liver == false){
                                self.Liver = true
                            }
                            else{
                                self.Liver = false
                            }
                        }, label:{
                            Image(self.Liver == true ? "check" : "uncheck")
                                .resizable()
                                .frame(width: 40, height: 40)
                        })
                    }
                    HStack(){
                        Text("Oysters")
                        
                        Spacer()
                        Button(action:{
                            if(self.Oysters == false){
                                self.Oysters = true
                            }
                            else{
                                self.Oysters = false
                            }
                        }, label:{
                            Image(self.Oysters == true ? "check" : "uncheck")
                                .resizable()
                                .frame(width: 40, height: 40)
                        })
                    }
                    
                    Spacer()
                    NavigationLink(destination: InitAllergies(), label:{
                       Text("Next")
                    })
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .onSubmit {
                            print(Marzipan)
                    }
                }
                .padding(.horizontal, 35.0)
            }
        
    }
}

struct InitAllergies: View {
    
    @State private var Eggs = false
    @State private var Milk = false
    @State private var Mustard = false
    @State private var Peanuts = false
    @State private var Fish  = false
    @State private var Soy  = false
    @State private var Wheat  = false
    
    var body: some View {
        
            ZStack{
                Color(UIColor(red: 0.783, green: 0.906, blue: 0.958, alpha: 1))
                .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    VStack(alignment: .leading) {
         
                        
                        Text("Hi Anteater, ")
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("Let’s get to know you better. ")
                            .font(.subheadline)
                            .fontWeight(.heavy)
                        Group{
                            Text("Select your allergies:")
                                .font(.body)
                                .padding(.top, 20)
                        }
                        
                        HStack(){
                            Text("Eggs")
                            
                            Spacer()
                            Button(action:{
                                if(self.Eggs == false){
                                    self.Eggs = true
                                }
                                else{
                                    self.Eggs = false
                                }
                            }, label:{
                                Image(self.Eggs == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                            
                        }
                        HStack(){
                            
                            Text("Milk")
                            Spacer()
                            Button(action:{
                                if(self.Milk == false){
                                    self.Milk = true
                                }
                                else{
                                    self.Milk = false
                                }
                            }, label:{
                                Image(self.Milk == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                            
                        }
                        HStack(){
                            Text("Mustard")
                            
                            Spacer()
                            Button(action:{
                                if(self.Mustard == false){
                                    self.Mustard = true
                                }
                                else{
                                    self.Mustard = false
                                }
                            }, label:{
                                Image(self.Mustard == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                        }
                        HStack(){
                            Text("Peanuts")
                            
                            Spacer()
                            Button(action:{
                                if(self.Peanuts == false){
                                    self.Peanuts = true
                                }
                                else{
                                    self.Peanuts = false
                                }
                            }, label:{
                                Image(self.Peanuts == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                        }
                        HStack(){
                            Text("Fish")
                            
                            Spacer()
                            Button(action:{
                                if(self.Fish == false){
                                    self.Fish = true
                                }
                                else{
                                    self.Fish = false
                                }
                            }, label:{
                                Image(self.Fish == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                        }
                        HStack(){
                            Text("Soy")
                            
                            Spacer()
                            Button(action:{
                                if(self.Soy == false){
                                    self.Soy = true
                                }
                                else{
                                    self.Soy = false
                                }
                            }, label:{
                                Image(self.Soy == true ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                        }
                    }
                    HStack(){
                        Text("Wheat")
                        
                        Spacer()
                        Button(action:{
                            if(self.Wheat == false){
                                self.Wheat = true
                            }
                            else{
                                self.Wheat = false
                            }
                        }, label:{
                            Image(self.Wheat == true ? "check" : "uncheck")
                                .resizable()
                                .frame(width: 40, height: 40)
                        })
                    }
                    
                    Spacer()
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), label:{
                       Text("Submit")
                    })
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .onSubmit {
                            print(Eggs)
                    }
                }
                .padding(.horizontal, 35.0)
            }
        
    }
}



struct initFoodRecording_preview: PreviewProvider {
    static var previews: some View {
        initWeight()
    }
}
