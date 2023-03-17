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
    @State private var selection = 2
    var body: some View {
        TabView (selection: $selection) {
            RecommendationView()
                .tabItem {
                    Label("Recommendation", systemImage: "list.bullet")
                }
                .environmentObject(vm)
                .tag(1)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .environmentObject(vm)
                .tag(2)
            AddDataView()
                .tabItem {
                    Label("Add Data", systemImage: "pencil")
                }
                .environmentObject(vm)
                .tag(3)
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
