//
//  RecommendationItem.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/5/23.
//

import Foundation

struct Food: Identifiable {
    let id: Int
    let name: String
    let description: String
    let calories: Int
    let contains: [String]
    var checked: Bool
}

struct UserInfo {
    let id: Int
    let user_name: String
    let current_weight: Float
    let target_weight: Float
    let rec_calories: Int
    let taken_calories: Int
    let food_list: [Food]
}
