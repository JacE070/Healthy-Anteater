//
//  ContentView.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/5/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
//        if (!manager.isStarted()) {
//            WelcomeView()
//        } else {
//            TabView {
//                RecommendationView()
//                    .tabItem {
//                        Label("Recommendation", systemImage: "list.bullet")
//                    }
//                ProfileView()
//                    .tabItem {
//                        Label("Profile", systemImage: "person")
//                    }
//            }
//        }
        TabView {
            RecommendationView()
                .tabItem {
                    Label("Recommendation", systemImage: "list.bullet")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}