//
//  Models.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/20/23.
//

import Foundation

public struct Food: Identifiable {
    public let id: Int
    let name: String
//    let description: String
    let calories: Int
    let contains: [String]
    var checked: Bool
}

// weights are double since cannot cast NSNumber to Float in data processing
public struct UserInfoMain {
    let id: Int
    let user_name: String
    let current_weight: Double
    let target_weight: Double
    let rec_calories: Int
    let taken_calories: Int
    let food_list: [Food]
}

public struct UserInfo {
    let id: Int
    let user_name: String
    let gender: String
    let age: Int
    let height: Double
    let current_weight: Double
    let target_weight: Double
    let calories_recommended: Int
}

public struct UserPreference {
    let user_id: Int
    var breakfast: Int
    var lunch: Int
    var dinner: Int
    var snack: Int
    var dislike: [String]
    var allergies: [String]
}
