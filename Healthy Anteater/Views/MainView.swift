//
//  ContentView.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/5/23.
//

import SwiftUI
import HealthKit

struct MainView: View {
    @EnvironmentObject var vm: HealthKitViewModel
    var body: some View {
        TabView {
            RecommendationView()
                .tabItem {
                    Label("Recommendation", systemImage: "list.bullet")
                }
                .environmentObject(vm)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .environmentObject(vm)
            
            AddDataView()
                .tabItem {
                    Label("Add Data", systemImage: "pencil")
                }
                .environmentObject(vm)
        }.onAppear {
//            vm = HealthKitViewModel()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
