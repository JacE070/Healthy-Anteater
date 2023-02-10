//
//  UpdateTargetView.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/8/23.
//

import SwiftUI

struct UpdateTargetView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var target_weight: Double? = nil
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

struct UpdateTargetView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateTargetView()
    }
}
