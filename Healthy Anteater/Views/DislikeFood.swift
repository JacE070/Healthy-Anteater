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
                    Button("Submit") {
                        self.mode.wrappedValue.dismiss()
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
        }
    }
}


struct DislikeFood_preview: PreviewProvider {
    static var previews: some View {
        DislikeFood()
    }
}
