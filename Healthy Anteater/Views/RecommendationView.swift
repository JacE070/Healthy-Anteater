//
//  RecommendationView.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/5/23.
//

import SwiftUI

struct RecommendationView: View {
    var body: some View {
        VStack(){
            Image("image_placeholder")
            Text("Welcome")
            Text("are you ready to be an Healthy Anteater?")
            Text("A healthy lifestyle...")
            RecommendationListView()
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}

struct RecommendationListView: View {
    var body: some View {
        Text("Rec List")
    }
}

struct RecommendationItemView: View {
    var body: some View {
        Text("Rec Item")
    }
}
