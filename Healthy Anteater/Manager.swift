//
//  Manager.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/5/23.
//

import Foundation
import SwiftUI
import HealthKit

let FAKE_URL_ENDPOINT = "https://my.api.mockaroo.com?key=3a9bab50"
let API_ENDPOINT = "localhost:8080"
var fake_api = URLComponents(url: URL(string: FAKE_URL_ENDPOINT)!, resolvingAgainstBaseURL: true)
var api = URLComponents(url: URL(string: API_ENDPOINT)!, resolvingAgainstBaseURL: true)
var is_mock = true

func makeRequest(path: String, method: String, body: [String: Any]) -> URLRequest {
    // Example
    // path = /food
    // return: https://my.api.com/food
    api?.path = path
    let request = NSMutableURLRequest(url: api!.url!)
    request.httpMethod = method
    request.httpBody = try? JSONSerialization.data(withJSONObject: body)
    return request as URLRequest
}

class Manager {
    private var started = false
    public var userInfo: UserInfo? = nil
    public var userid: Int? = nil
    public var userPref: UserPreference? = nil
    public var userInfoMain: UserInfoMain? = nil
    
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
    static func checkLogin(email: String, password: String) -> Bool{
        if(email.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
            return false
        }
        else{
            return true
        }
    }
    
    func getUserId() -> Int {
        return userInfo!.id
    }
}

let manager = Manager()

func getUserInfo(userid: Int) async -> UserInfo? {
//    Get Request
//    user_id: int
//    username: string
//    current_weight: float
//    target_weight: float
//    recommended_calories: int
//    taken_calories: int
//    food_list: [Food, ]
    let path = "/user"
    
    let request = makeRequest(path: path, method: "GET", body: ["userid": userid])
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
        let userInfo = toUserInfo(json: json!)
        return userInfo
    }
    catch {
        return nil
    }
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
    let request = makeRequest(path: path, method: "GET", body: ["userid": manager.getUserId()])
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String: Any]]
        let foodList = toFoodList(json: json!)
        return foodList
    }
    catch {
        return [Food]()
    }
}

func finishFoodRec(user_id: Int, food_id: Int) async {
    // Put Request
    // user_id: int
    // food_id: int
    let path = "/food"
    let request = makeRequest(path: path, method: "PUT", body: ["userid": user_id, "foodid": food_id])
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
//        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String: Any]]
    }
    catch {
        
    }

}

func getPreference() async {
    let path = "/user/preference"
    let request = makeRequest(path: path, method: "GET", body: ["userid": manager.getUserId()])
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
        let userPref = toUserPref(json: json)
        manager.userPref = userPref
    }
    catch {
        
    }
}

func updatePreference(breakfast: Bool, lunch: Bool, dinner: Bool, snack: Bool, dislike: [String], allergies: [String]) async {
    // Put Request
    // user_id: int
    // breakfast: bool
    // lunch: bool
    // dinner: bool
    // snack: bool
    // dislike: [string, ]
    // allergies: [string, ]
    let path = "/user/preference"
    let body: [String: Any] = [
        "userid": manager.getUserId(),
        "breakfast": manager.userPref!.breakfast,
        "lunch": manager.userPref!.lunch,
        "dinner": manager.userPref!.dinner,
        "snack": manager.userPref!.snack,
        "dislike": manager.userPref!.dislike,
        "allergies": manager.userPref!.allergies
    ]
    let request = makeRequest(path: path, method: "PUT", body: body)
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
//        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
    }
    catch {
        
    }
    
}

func getUserInfoMain(userid: Int) async -> UserInfoMain? {
//    Get Request
    let path = "/user/main"
    
    let request = makeRequest(path: path, method: "GET", body: ["userid": userid])
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
        let userInfoMain = toUserInfoMain(json: json)
        return userInfoMain
    }
    catch {
        return nil
    }
}

func updateUserInfo(gender: String, age: Int, height: Int) async {
    // Put Request
    // user_id: int
    // username: string
    // gender: string
    // age: int
    // height: int
    let path = "/user"
    let body: [String: Any] = [
        "gender": gender,
        "age": age,
        "height": height
    ]
    let request = makeRequest(path: path, method: "PUT", body: body)
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
    }
    catch {
        
    }
}

func updateUserWeight(current_weight: Double, target_weight: Double) async {
    // Put Request
    // user_id: int
    // weight: float
    // target: float
    let path = "/user/weight"
    let body: [String: Any] = [
        "current_weight": current_weight,
        "target_weight": target_weight,
    ]
    let request = makeRequest(path: path, method: "PUT", body: body)
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
    }
    catch {
        
    }
}

func register(username: String, password: String) async -> Bool {
    let path = "/register"
    let request = makeRequest(path: path, method: "POST", body: ["username": username, "password": password])
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
    }
    catch {
        return false
    }
    return true
}

func login(username: String, password: String) async -> Bool {
    // If true -> getUserInfo, update userInfo to manager
    let path = "/login"
    let request = makeRequest(path: path, method: "GET", body: ["username": username, "password": password])
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
        manager.userInfo = await getUserInfo(userid: json!["id"] as! Int)
        manager.userInfoMain = await getUserInfoMain(userid: json!["id"] as! Int)
    }
    catch {
        return false
    }
    return true
}

func toFoodList(json: [[String: Any]]) -> [Food] {
    var foodList = [Food]()
    json.forEach { item in
        let food = Food(id: item["food_id"] as! Int,
                        name: item["name"] as! String,
                        description: item["description"] as! String,
                        calories: item["calories"] as! Int,
                        contains: [item["contains"] as! String],
                        checked: (item["checked"] != nil))
        foodList.append(food)
    }
    return foodList
}

func toUserInfo(json: [String: Any]) -> UserInfo {
    return UserInfo(id: json["user_id"] as! Int,
                        user_name: json["username"] as! String,
                        gender: json["gender"] as! String,
                        age: json["age"] as! Int,
                        height: json["height"] as! Int,
                        current_weight: json["current_weight"] as! Double,
                        target_weight: json["target_weight"] as! Double,
                        calories_recommended: json["calories"] as! Int)
}

func toUserInfoMain(json: [String: Any]) -> UserInfoMain {
    let fake_food_list = [Food(id: 0, name: "Food 1", description: "Food1 Description", calories: 500, contains: ["Peanuts"], checked: false),
                          Food(id: 1, name: "Food 2", description: "Food2 Description", calories: 500, contains: ["Seafood"], checked: true)]
    return UserInfoMain(id: json["user_id"] as! Int,
                    user_name: json["username"] as! String,
                    current_weight: json["current_weight"] as! Double,
                    target_weight: json["target_weight"] as! Double,
                    rec_calories: json["calories_recommended"] as! Int,
                    taken_calories: json["calories_intake"] as! Int,
                    food_list: is_mock ? fake_food_list :
                        toFoodList(json: json["food_list"] as! [[String : Any]]))
    }

func toUserPref(json: [String: Any]) -> UserPreference {
    return UserPreference(user_id: json["userid"] as! Int,
                          breakfast: json["breakfast"] as! Int == 1 ? true : false,
                          lunch: json["lunch"] as! Int == 1 ? true : false,
                          dinner: json["dinner"] as! Int  == 1 ? true : false,
                          snack: json["snack"] as! Int  == 1 ? true : false,
                          dislike: json["dislike"] as! [String],
                          allergies: json["allergies"] as! [String])
}
