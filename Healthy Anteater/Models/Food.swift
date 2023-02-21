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