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
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(30)
            VStack(alignment: .leading){
//                Text("Welcome")
//                    .font(.title)
//                    .fontWeight(.heavy)
//                Text("are you ready to be an Healthy Anteater?")
//                    .font(.title2)
//                Text("A healthy lifestyle is the first step towars success; improve your health index by using the Healthy Anteater App!")
                Text("Here are recommendations we prepare for you!")
                    .font(.headline)
                    .fontWeight(.medium)
            }.padding(.horizontal, 30.0)
            Spacer();
            RecommendationList()
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}

struct RecommendationList: View {
    @State var foodList = [Food]()
    var body: some View {
        List(foodList) { food in
            HStack(){
                Text(food.name)
                
                Spacer()
                Button("Finish"){
                    // Call method in Manager to update data
                }
                .buttonStyle(.borderedProminent)
            }
        }.scrollContentBackground(.hidden)
            .task {
                foodList = await getFoodList()
            }
    }
}
