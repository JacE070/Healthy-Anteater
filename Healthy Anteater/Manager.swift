//
//  Manager.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/5/23.
//

import Foundation

let FAKE_URL_ENDPOINT = "https://my.api.mockaroo.com?key=3a9bab50"
var fake_api = URLComponents(url: URL(string: FAKE_URL_ENDPOINT)!, resolvingAgainstBaseURL: true)

func makeURL(path: String) -> String {
    // Example
    // path = /food
    // return: https://my.api.com/food
    fake_api?.path = path
    return (fake_api?.string!)!
}


class Manager {
    private var started = false;
    
    func isStarted() -> Bool {
        return started
    }
    
    func getStarted() {
        started = true;
    }
    
    static func checkUpdateWeight(gender: String, age: Int?, weight: Double?, height: Double?) -> Bool {
        if (age == nil || weight == nil || height == nil){
            return false
        }
        if (gender == "Required") {
            return false
        }
        if (age! < 0 || weight! < 0 || height! < 0){
            return false
        }
        return true
    }
}

let manager = Manager()

func getUserInfo() {
//    Get Request
//    user_id: int
//    username: string
//    current_weight: float
//    target_weight: float
//    recommended_calories: int
//    taken_calories: int
//    food_list: [Food, ]
    let path = "/info"
    print(makeURL(path: path))
    
}

func getFoodList() {
//    Get Request
//    food_list: [Food, ]
//    Food
//    food_id: int
//    name: string
//    description: string
//    calories: int
//    contains: [string, ]
//    checked: false
    let path = "/food"
    

}

func finishFoodRec() {
    // Put Request
    // user_id: int
    // food_id: int
    let path = "/food"
    
}

func updatePreference() {
    // Put Request
    // user_id: int
    // breakfast: bool
    // lunch: bool
    // snack: bool
    // dislike: [string, ]
    // allergies: [string, ]
    let path = "/user/preference"
    
}

func updateUserInfo() {
    // Put Request
    // user_id: int
    // username: string
    // geneder: string
    // age: int
    // height: int
    let path = "/user"
    
}

func updateUserWeight() {
    // Put Request
    // user_id: int
    // weight: float
    // target: float
    let path = "/weight"
    
}
