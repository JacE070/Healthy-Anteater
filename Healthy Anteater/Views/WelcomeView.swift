//
//  ContentView.swift
//  Healthy Anteater
//
//  Created by JacEL on 1/26/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                Image("image_placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(70.0)
                    
                Text("Welcome,")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("are you ready to be an Healthy Anteater?")
                    .font(.subheadline)
                    .fontWeight(.heavy)
                Text("A healthy lifestyle is the first step towards success; improve your health index by using the Healthy Anteater App!")
                    .font(.body)
                    .padding(.bottom, 70.0)
                    .padding(.top, 30)
            }
            // TODO: Should use navigationlink, but should be under navigationview
            Button("Get Started") {
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
        }
        .padding(.horizontal, 35.0)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
