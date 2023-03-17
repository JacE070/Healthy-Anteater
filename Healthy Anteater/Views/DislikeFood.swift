//
//  DislikeFood.swift
//  Healthy Anteater
//
//  Created by Haoran Li on 2/22/23.
//

import Foundation
import SwiftUI


struct DislikeFood: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var Marzipan = manager.userPref!.dislike.contains("cheese")
    @State private var Olives = manager.userPref!.dislike.contains("olives")
    @State private var Onions = manager.userPref!.dislike.contains("onions")
    @State private var Sushi = manager.userPref!.dislike.contains("sushi")
    @State private var Broccoli  = manager.userPref!.dislike.contains("broccoli")
    @State private var Tofu  = manager.userPref!.dislike.contains("tofu")
    @State private var Fish  = manager.userPref!.dislike.contains("fish")
    @State private var Liver  = manager.userPref!.dislike.contains("liver")
    @State private var Oysters  = manager.userPref!.dislike.contains("oysters")
    @State private var DislikeList:[String]  = manager.userPref!.dislike
    
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
                                    DislikeList = DislikeList.filter(){$0 != "cheese"}
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
                                    DislikeList = DislikeList.filter(){$0 != "olives"}
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
                                    DislikeList = DislikeList.filter(){$0 != "onions"}
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
                                    DislikeList = DislikeList.filter(){$0 != "sushi"}
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
                                    DislikeList = DislikeList.filter(){$0 != "broccoli"}
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
                                    DislikeList = DislikeList.filter(){$0 != "tofu"}
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
                                    self.DislikeList.append("fish")
                                }
                                else{
                                    self.Fish = false
                                    DislikeList = DislikeList.filter(){$0 != "fish"}
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
                                DislikeList = DislikeList.filter(){$0 != "liver"}
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
                                DislikeList = DislikeList.filter(){$0 != "oysters"}
                            }
                        }, label:{
                            Image(self.Oysters == true ? "check" : "uncheck")
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
                                           dislike: DislikeList,
                                           allergies: manager.userPref!.allergies)
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
                            print(Marzipan)
                    }
                }
                .padding(.horizontal, 35.0)
            }
        }.onAppear {
            Marzipan = manager.userPref!.dislike.contains("cheese")
            Olives = manager.userPref!.dislike.contains("olives")
            Onions = manager.userPref!.dislike.contains("onions")
            Sushi = manager.userPref!.dislike.contains("sushi")
            Broccoli  = manager.userPref!.dislike.contains("broccoli")
            Tofu  = manager.userPref!.dislike.contains("tofu")
            Fish  = manager.userPref!.dislike.contains("fish")
            Liver  = manager.userPref!.dislike.contains("liver")
            Oysters  = manager.userPref!.dislike.contains("oysters")
            DislikeList = manager.userPref!.dislike
        }
    }
}


struct DislikeFood_preview: PreviewProvider {
    static var previews: some View {
        DislikeFood()
    }
}
