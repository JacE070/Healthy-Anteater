//
//  UpdateWeightView.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/8/23.
//

import SwiftUI

struct UpdateWeightView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var gender = "Required"
    let genders = ["Required", "Male", "Female"]
    @State private var age: Int? = nil
    @State private var weight: Double? = nil
    @State private var height: Double? = nil
    @State private var showErrorMessage = false
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
                    Text("Please select your age:")
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
                    self.mode.wrappedValue.dismiss()
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

struct UpdateWeightView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateWeightView()
    }
}
