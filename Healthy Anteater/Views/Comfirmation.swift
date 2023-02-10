//
//  Comfirmation.swift
//  Healthy Anteater
//
//  Created by Haoran Li on 2/9/23.
//

import Foundation
import SwiftUI

struct Comfirmation: View {
    var body: some View {
        
        ZStack{
            Color(UIColor(red: 0.783, green: 0.906, blue: 0.958, alpha: 1))
            .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Image("undraw_Done_re_oak4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(70.0)
                        
                    Text("Nice Job,")
                        .font(.title)
                        .fontWeight(.heavy)
                    Text("You have successfully submitted your data! ")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                }
                Spacer()

                NavigationLink(destination: MainView().navigationBarBackButtonHidden(true), label:{
                   Text("Back to Home Page")
                })
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
            }
            .padding(.horizontal, 35.0)
        }
    
    }
}

struct Comfirmation_preview: PreviewProvider {
    static var previews: some View {
        Comfirmation()
    }
}
