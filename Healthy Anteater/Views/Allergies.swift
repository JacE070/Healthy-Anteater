//
//  Allergies.swift
//  Healthy Anteater
//
//  Created by Haoran Li on 2/22/23.
//

import Foundation
import SwiftUI


struct Allergies: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var Eggs = manager.userPref!.allergies.contains("eggs")
    @State private var Milk = manager.userPref!.allergies.contains("milk")
    @State private var Mustard = manager.userPref!.allergies.contains("mustard")
    @State private var Peanuts = manager.userPref!.allergies.contains("peanuts")
    @State private var Fish  = manager.userPref!.allergies.contains("fish")
    @State private var Soy  = manager.userPref!.allergies.contains("soy")
    @State private var Wheat  = manager.userPref!.allergies.contains("wheat")
    @State private var allergies: [String] = manager.userPref!.allergies
    
    var body: some View {
        NavigationView{
        
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
                                    allergies = allergies.filter(){$0 != "egg"}
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
                                    allergies = allergies.filter(){$0 != "milk"}
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
                                    allergies = allergies.filter(){$0 != "mustard"}
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
                                    allergies = allergies.filter(){$0 != "peanuts"}
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
                                    allergies = allergies.filter(){$0 != "fish"}
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
                                    allergies = allergies.filter(){$0 != "soy"}
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
                                allergies = allergies.filter(){$0 != "wheat"}
                            }
                        }, label:{
                            Image(self.Wheat == true ? "check" : "uncheck")
                                .resizable()
                                .frame(width: 40, height: 40)
                        })
                    }
                    
                    Spacer()
                    Button("Submit") {
                        Task {
                            await sendPref(id: manager.getUserId(),
                                           breakfast: manager.userPref!.breakfast,
                                           lunch: manager.userPref!.lunch,
                                           dinner: manager.userPref!.dinner,
                                           snack: manager.userPref!.snack,
                                           dislike: manager.userPref!.dislike,
                                           allergies: allergies)
                            self.mode.wrappedValue.dismiss()
                        }
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .onSubmit {
                            print(Eggs)
                    }
                }
                .padding(.horizontal, 35.0)
            }
        }.onAppear {
            Eggs = manager.userPref!.allergies.contains("eggs")
            Milk = manager.userPref!.allergies.contains("milk")
            Mustard = manager.userPref!.allergies.contains("mustard")
            Peanuts = manager.userPref!.allergies.contains("peanuts")
            Fish  = manager.userPref!.allergies.contains("fish")
            Soy  = manager.userPref!.allergies.contains("soy")
            Wheat  = manager.userPref!.allergies.contains("wheat")
            allergies = manager.userPref!.allergies
        }
    }
}


struct Allergies_preview: PreviewProvider {
    static var previews: some View {
        Allergies()
    }
}

