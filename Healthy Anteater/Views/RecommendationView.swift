//
//  RecommendationView.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/5/23.
//

import SwiftUI

struct RecommendationView: View {
    var body: some View {
        GeometryReader { g in
            ScrollView {
                VStack(){
                    Header()
                    Spacer();
                    RecommendationList()
                        .frame(width: g.size.width - 5, height: g.size.height - 50, alignment: .center)
                }
            }
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
                VStack(alignment: .leading){
                    Text(food.name)
                    Text("Calories: " + String(food.calories))
                        
                }
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

struct Header: View {
    var body: some View {
        Image("image_placeholder")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(30)
        VStack(alignment: .leading){
            Text("Here are recommendations we prepare for you!")
                .font(.headline)
                .fontWeight(.medium)
        }.padding(.horizontal, 30.0)
    }
}
