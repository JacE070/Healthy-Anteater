//
//  AddDataView.swift
//  Healthy Anteater
//
//  Created by Haoran Li on 2/9/23.
//


import Foundation
import SwiftUI

struct AddDataView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color(UIColor(red: 0.783, green: 0.906, blue: 0.958, alpha: 1))
                .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Image("undraw_My_answer_re_k4dv")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(70.0)
                            
                        Text("Hi Evan, ")
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("Let us know about your day.")
                            .font(.subheadline)
                            .fontWeight(.heavy)
                    }

                    NavigationLink(destination: Comfirmation(), label:{
                       Text("Food Preference")
                    })
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                    NavigationLink(destination: Comfirmation(), label:{
                       Text("Update Weight    ")
                    })
                    .padding(.all)
                    .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                    NavigationLink(destination: Comfirmation(), label:{
                       Text("Update Target     ")
                    })
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                }
                .padding(.horizontal, 35.0)
            }
        }
    }
}

struct AddDataView_preview: PreviewProvider {
    static var previews: some View {
        AddDataView()
    }
}

