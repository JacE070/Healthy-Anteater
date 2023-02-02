//
//  InitializationView.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/1/23.
//

import SwiftUI

struct InitializationView: View {
    @State private var gender = "unselected"
    let genders = ["male", "female"]
    @State private var age: Int? = nil
    @State private var weight: Int? = nil
    @State private var height: Int? = nil
    var body: some View {
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
                    TextField("Age", value: $age, formatter: NumberFormatter())
                }
                Group{
                    Text("Please enter your weight:")
                    TextField("Weight", value: $weight, formatter: NumberFormatter())
                }
                Group{
                    Text("Please enter your height in cm:")
                    TextField("Height", value: $height, formatter: NumberFormatter())
                }
                
            }.padding(.bottom, 50)
            
            Spacer()
            // TODO: Should use navigationlink, but should be under navigationview
            Button("Continue") {
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .buttonStyle(.borderedProminent)
                .controlSize(.large)
        }
        .padding(.horizontal, 35.0)
    }
}

struct InitializationView_Previews: PreviewProvider {
    static var previews: some View {
        InitializationView()
    }
}
