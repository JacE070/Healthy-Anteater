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
    @State private var age: Int! = nil
    @State private var weight: Double! = nil
    @State private var height: Double! = nil
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
                        updateUser()
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
    func updateUser(){
        Task{
            await updateUserInfo(id: manager.userid, gender: gender, age: age, height: height, current_weight: weight, target_weight: 0)
        }
    }
}


struct initTarget: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var target_weight: Double = 0
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
                    Text("Please enter your target weight in kg:")
                    TextField("Required", value: $target_weight, format: .number)
                        .padding(.bottom, 10)
                }
                
            }.padding(.bottom, 50)
            
            Spacer()
            Button("Submit") {
                if target_weight != nil && target_weight > 0{
                    // Update
                    // Go back
                    updateTarget()
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
    func updateTarget(){
        Task{
            await updateUserWeight(id: manager.userid, current_weight: manager.userInfo?.current_weight as! Double, target_weight: target_weight)
        }
    }
}


struct initFoodRecording: View {
    @State private var breakfast = 0
    @State private var lunch = 0
    @State private var dinner = 0
    @State private var snack = 0
    @State private var dislike = []
    @State private var allergies = []
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
                                if(self.breakfast == 0){
                                    self.breakfast = 1
                                }
                                else{
                                    self.breakfast = 0
                                }
                            }, label:{
                                Image(self.breakfast == 1 ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                            
                        }
                        HStack(){
                            
                            Text("lunch")
                            Spacer()
                            Button(action:{
                                if(self.lunch == 0){
                                    self.lunch = 1
                                }
                                else{
                                    self.lunch = 0
                                }
                            }, label:{
                                Image(self.lunch == 1 ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                            
                        }
                        HStack(){
                            Text("dinner")
                            
                            Spacer()
                            Button(action:{
                                if(self.dinner == 0){
                                    self.dinner = 1
                                }
                                else{
                                    self.dinner = 0
                                }
                            }, label:{
                                Image(self.dinner == 1 ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            })
                        }
                        HStack(){
                            Text("snack")
                            
                            Spacer()
                            Button(action:{
                                if(self.snack == 0){
                                    self.snack = 1
                                }
                                else{
                                    self.snack = 0
                                }
                            }, label:{
                                Image(self.snack == 1 ? "check" : "uncheck")
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
                        print(snack)
                        print(dislike)
                        print(allergies)
                    }
                }
                .padding(.horizontal, 35.0)
            }
        }
    }
    func updatePref(){
        Task{
            await sendPref(id:manager.userid, breakfast: breakfast, lunch: lunch, dinner: dinner, snack: snack, dislike: dislike as! [String], allergies: allergies as! [String])
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
    @State private var DislikeList  = []
    @State private var allergies = []
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
                                    self.DislikeList.append("cheese")
                                }
                                else{
                                    self.Marzipan = false
                                    DislikeList = DislikeList.filter(){$0 as! String != "cheese"}
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
                                    self.DislikeList.append("olives")
                                }
                                else{
                                    self.Olives = false
                                    DislikeList = DislikeList.filter(){$0 as! String != "olives"}
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
                                    self.DislikeList.append("onions")
                                }
                                else{
                                    self.Onions = false
                                    DislikeList = DislikeList.filter(){$0 as! String != "onions"}
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
                                    self.DislikeList.append("sushi")
                                }
                                else{
                                    self.Sushi = false
                                    DislikeList = DislikeList.filter(){$0 as! String != "sushi"}
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
                                    self.DislikeList.append("broccoli")
                                }
                                else{
                                    self.Broccoli = false
                                    DislikeList = DislikeList.filter(){$0 as! String != "broccoli"}
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
                                    self.DislikeList.append("tofu")
                                }
                                else{
                                    self.Tofu = false
                                    DislikeList = DislikeList.filter(){$0 as! String != "tofu"}
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
                                    self.DislikeList.append("")
                                }
                                else{
                                    self.Fish = false
                                    DislikeList = DislikeList.filter(){$0 as! String != "fish"}
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
                                self.DislikeList.append("liver")
                            }
                            else{
                                self.Liver = false
                                DislikeList = DislikeList.filter(){$0 as! String != "liver"}
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
                                self.DislikeList.append("oysters")
                            }
                            else{
                                self.Oysters = false
                                DislikeList = DislikeList.filter(){$0 as! String != "oysters"}
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
                        print(self.DislikeList)
                        updateDislike()
                    }
                }
                .padding(.horizontal, 35.0)
            }
        
    }
    func updateDislike(){
        Task{
            await sendPref(id:manager.userid, breakfast: manager.userPref?.breakfast as! Int, lunch: manager.userPref?.lunch as! Int, dinner: manager.userPref?.dinner as! Int, snack: manager.userPref?.snack as! Int,
                dislike: DislikeList as! [String],
                allergies: allergies as! [String])
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
    @State private var allergies = []
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
                                    self.allergies.append("egg")
                                }
                                else{
                                    self.Eggs = false
                                    allergies = allergies.filter(){$0 as! String != "egg"}
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
                                    self.allergies.append("milk")
                                }
                                else{
                                    self.Milk = false
                                    allergies = allergies.filter(){$0 as! String != "milk"}
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
                                    self.allergies.append("mustard")
                                }
                                else{
                                    self.Mustard = false
                                    allergies = allergies.filter(){$0 as! String != "mustard"}
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
                                    self.allergies.append("peanuts")
                                }
                                else{
                                    self.Peanuts = false
                                    allergies = allergies.filter(){$0 as! String != "peanuts"}
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
                                    self.allergies.append("fish")
                                }
                                else{
                                    self.Fish = false
                                    allergies = allergies.filter(){$0 as! String != "fish"}
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
                                    self.allergies.append("soy")
                                }
                                else{
                                    self.Soy = false
                                    allergies = allergies.filter(){$0 as! String != "soy"}
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
                                self.allergies.append("wheat")
                            }
                            else{
                                self.Wheat = false
                                allergies = allergies.filter(){$0 as! String != "wheat"}
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
                            print(allergies)
                        updateAl()
                    }
                }
                .padding(.horizontal, 35.0)
            }
        
    }
    func updateAl(){
        Task{
            await sendPref(id:manager.userid, breakfast: manager.userPref?.breakfast as! Int, lunch: manager.userPref?.lunch as! Int, dinner: manager.userPref?.dinner as! Int, snack: manager.userPref?.snack as! Int,
                           dislike: manager.userPref?.dislike as! [String],
                allergies: allergies as! [String])
        }
    }
}



struct initFoodRecording_preview: PreviewProvider {
    static var previews: some View {
        initWeight()
    }
}
