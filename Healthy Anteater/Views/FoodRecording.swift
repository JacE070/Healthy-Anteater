//
//  FoodRecording.swift
//  Healthy Anteater
//
//  Created by Haoran Li on 2/9/23.
//

import Foundation
import SwiftUI


struct FoodRecording: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
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
                        Text("Let’s get to know you better. ")
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
                    Group{
                        Text("Type of food don’t like(sepetate by , For example: avocado, banana):")
                        TextField("Dislike", text: $dislike)
                        {
                            }
                    }
                    Group{
                        Text("Food allergies(sepetate by , For example: avocado, banana):")
                        TextField("Allergies", text: $allergies)
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
struct FoodRecording_preview: PreviewProvider {
    static var previews: some View {
        FoodRecording()
    }
}
