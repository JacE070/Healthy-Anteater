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
let API_ENDPOINT = "http://127.0.0.1:8080"
var fake_api = URLComponents(url: URL(string: FAKE_URL_ENDPOINT)!, resolvingAgainstBaseURL: true)
var api = URLComponents(url: URL(string: API_ENDPOINT)!, resolvingAgainstBaseURL: true)
var is_mock = true

func makeRequest(path: String, method: String, body: [String: Any]) -> URLRequest {
    // Example
    // path = /food
    // return: https://my.api.com/food
//    api?.path = path
    let request = NSMutableURLRequest(url: URL(string: "\(API_ENDPOINT)\(path)")!)
    request.httpMethod = method
    request.httpBody = try? JSONSerialization.data(withJSONObject: body)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    return request as URLRequest
}

class Manager {
    private var started = false
    public var userInfo: UserInfo? = nil
    public var userid: Int = 0
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
    
    let request = makeRequest(path: path, method: "POST", body: ["userid": userid])
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
    let request = makeRequest(path: path, method: "POST", body: ["userid": manager.getUserId()])
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
    let path = "/preference"
    let request = makeRequest(path: path, method: "POST", body: ["userid": manager.getUserId()])
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
        let userPref = toUserPref(json: json)
        manager.userPref = userPref
    }
    catch {
        
    }
}

/*
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
 */

func getUserInfoMain(userid: Int) async -> UserInfoMain? {
//    Get Request
    let path = "/user/main"
    
    let request = makeRequest(path: path, method: "POST", body: ["userid": userid])
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

func updateUserInfo(id: Int, gender: String, age: Int, height: Double ,current_weight: Double, target_weight: Double) async {
    // Put Request
    // user_id: int
    // username: string
    // gender: string
    // age: int
    // height: int
    let path = "/user"
    let body: [String: Any] = [
        "id": id,
        "gender": gender,
        "age": age,
        "height": height,
        "weight": current_weight,
        "target": target_weight,
    ]
    let request = makeRequest(path: path, method: "PUT", body: body)
    do {
        let (data, res) = try await URLSession.shared.data(for: request)
        //let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
        print(res)
        
        manager.userInfo = await getUserInfo(userid: id)
        manager.userInfoMain = await getUserInfoMain(userid: id)
        print(manager.userInfo?.current_weight)
        
    }
    catch {
        
    }
}

func updateUserWeight(id: Int, current_weight: Double, target_weight: Double) async {
    // Put Request
    // user_id: int
    // weight: float
    // target: float
    let path = "/user/weight"
    print(target_weight)
    let body: [String: Any] = [
        "id": id,
        "weight": current_weight,
        "target": target_weight,
    ]
    let request = makeRequest(path: path, method: "PUT", body: body)
    do {
        let (data, res) = try await URLSession.shared.data(for: request)
        //let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
        print(res)
        manager.userInfo = await getUserInfo(userid: id)
    
        print(manager.userInfo)
        manager.userInfoMain = await getUserInfoMain(userid: id)
    }
    catch {
        
    }
}

func sendRegister(username: String, password: String) async -> Bool {
    let path = "/user/register"
    let request = makeRequest(path: path, method: "POST", body: ["id": 0, "username": username, "password": password])
    do {
//        print(request.httpMethod!)
//        print(try JSONSerialization.jsonObject(with: request.httpBody!))
        let (data, res) = try await URLSession.shared.data(for: request)
        if let r = res as? HTTPURLResponse {
            print(r.statusCode)
            if (r.statusCode == 200) {
                let path = "/user/login"
                let request = makeRequest(path: path, method: "POST", body: ["username": username, "password": password])
                do {
                    let (data, res) = try await URLSession.shared.data(for: request)
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                    print(res)
                    manager.userid = json!["id"] as! Int
                    
                }
                return true
            }
        }
        return false
    }
    catch {
        return false
    }
}

func sendLogin(username: String, password: String) async -> Bool {
    // If true -> getUserInfo, update userInfo to manager
    let path = "/user/login"
    // FIXME: Get method must not have body
    let request = makeRequest(path: path, method: "POST", body: ["username": username, "password": password])
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
        if json!["id"] == nil {
            return false
        }
        manager.userInfo = await getUserInfo(userid: json!["id"] as! Int)
        manager.userInfoMain = await getUserInfoMain(userid: json!["id"] as! Int)
        manager.userid = json!["id"] as! Int
    }
    catch {
        return false
    }
    return true
}

func sendPref(id: Int, breakfast: Int, lunch: Int, dinner:Int, snack:Int, dislike:[String], allergies:[String]) async {
    let path = "/preference"
    let body: [String: Any] = [
        "id": id,
        "breakfast": breakfast,
        "lunch": lunch,
        "dinner":dinner,
        "snack":snack,
        "dislike":dislike,
        "allergies":allergies,
    ]
    print(body)
    let request = makeRequest(path: path, method: "PUT", body: body)
    do {
        let (data, res) = try await URLSession.shared.data(for: request)
        //let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
        print(res)
        manager.userInfo = await getUserInfo(userid: id)
        manager.userInfoMain = await getUserInfoMain(userid: id)
        await getPreference()
    }
    catch {
        
    }
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
    return UserInfo(id: json["id"] as! Int,
                        user_name: json["username"] as! String,
                        gender: json["gender"] as! String,
                        age: json["age"] as! Int,
                        height: json["height"] as! Double,
                        current_weight: json["weight"] as! Double,
                        target_weight: json["target"] as! Double,
                        calories_recommended: json["calories"] as! Int)
}

func toUserInfoMain(json: [String: Any]) -> UserInfoMain {
    let fake_food_list = [Food(id: 0, name: "Food 1", description: "Food1 Description", calories: 500, contains: ["Peanuts"], checked: false),
                          Food(id: 1, name: "Food 2", description: "Food2 Description", calories: 500, contains: ["Seafood"], checked: true)]
    return UserInfoMain(id: json["userid"] as! Int,
                    user_name: json["username"] as! String,
                    current_weight: json["weight"] as! Double,
                    target_weight: json["target"] as! Double,
                    rec_calories: json["calories"] as! Int,
                    taken_calories: json["taken"] as! Int,
                    food_list: is_mock ? fake_food_list :
                        toFoodList(json: json["foodlist"] as! [[String : Any]]))
    }

func toUserPref(json: [String: Any]) -> UserPreference {
    return UserPreference(user_id: json["id"] as! Int,
                          breakfast: json["breakfast"] as! Int,
                          lunch: json["lunch"] as! Int ,
                          dinner: json["dinner"] as! Int ,
                          snack: json["snack"] as! Int ,
                          dislike: json["dislike"] as! [String],
                          allergies: json["allergies"] as! [String])
}
