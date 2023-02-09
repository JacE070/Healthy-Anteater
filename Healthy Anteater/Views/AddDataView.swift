//
//  AddDataView.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/8/23.
//

import SwiftUI

struct AddDataView: View {
    let name = "Evan"
    var body: some View {
        NavigationView{
            VStack(){
                VStack(alignment:.leading){
                    Image("image_placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(30)
                    Text("Hi \(name),\nLet us know about your day")
                }
                .frame(maxWidth: 300)
                Spacer()
                NavigationLink{
                    
                } label: {
                    Text("Food Preference")
                        .frame(maxWidth: 300, maxHeight: 50)
                }
                .buttonStyle(.borderedProminent)
                Spacer()
                NavigationLink{
                    UpdateWeightView()
                } label: {
                    Text("Update Weight")
                        .frame(maxWidth: 300, maxHeight: 50)
                }
                .buttonStyle(.borderedProminent)
                Spacer()
                NavigationLink{
                    UpdateTargetView()
                } label: {
                    Text("Update Target")
                        .frame(maxWidth: 300, maxHeight: 50)
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
        }
    }
}

struct AddDataView_Previews: PreviewProvider {
    static var previews: some View {
        AddDataView()
    }
}
