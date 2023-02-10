//
//  ContentView.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/5/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            RecommendationView()
                .tabItem {
                    Label("Recommendation", systemImage: "list.bullet")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            
            AddDataView()
                .tabItem {
                    Label("Add Data", systemImage: "pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
