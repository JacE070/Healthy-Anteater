//
//  Manager.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/5/23.
//

import Foundation
import SwiftUI

let FAKE_URL_ENDPOINT = "https://my.api.mockaroo.com?key=3a9bab50"
var fake_api = URLComponents(url: URL(string: FAKE_URL_ENDPOINT)!, resolvingAgainstBaseURL: true)

func makeRequest(path: String, method: String) -> URLRequest {
    // Example
    // path = /food
    // return: https://my.api.com/food
    fake_api?.path = path
    let request = NSMutableURLRequest(url: fake_api!.url!)
    request.httpMethod = method
    return request as URLRequest
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
    let request = makeRequest(path: path, method: "GET")
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

        if let error = error {
            // Handle HTTP request error
            print(error)
        } else if let data = data {
            // Handle HTTP request response
//            print(dataToJSON(data: data))
        } else {
            // Handle unexpected error
            print("unexpected error")
        }
    }
    task.resume()
}

func getFoodList() async -> [Food] {
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
    let request = makeRequest(path: path, method: "GET")
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = dataToJSON(data: data)
        let foodList = toFoodList(json: json!)
        return foodList
    }
    catch {
        return [Food]()
    }
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

func dataToJSON(data: Data) -> [[String: Any]]? {
    do {
        return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String: Any]]
    } catch {
        print(error)
    }
    return nil
}

func toFoodList(json: [[String: Any]]) -> [Food] {
    var foodList = [Food]()
    json.forEach { item in
        let food = Food(id: item["food_id"] as! Int, name: item["name"] as! String, description: item["description"] as! String, calories: item["calories"] as! Int, contains: [item["contains"] as! String], checked: (item["checked"] != nil))
        foodList.append(food)
    }
    return foodList
}
