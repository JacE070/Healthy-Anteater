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
    @State private var Eggs = false
    @State private var Milk = false
    @State private var Mustard = false
    @State private var Peanuts = false
    @State private var Fish  = false
    @State private var Soy  = false
    @State private var Wheat  = false
    
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
                            print(Eggs)
                    }
                }
                .padding(.horizontal, 35.0)
            }
        }
    }
}


struct Allergies_preview: PreviewProvider {
    static var previews: some View {
        Allergies()
    }
}

