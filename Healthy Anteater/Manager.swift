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
var fake_api = URLComponents(url: URL(string: FAKE_URL_ENDPOINT)!, resolvingAgainstBaseURL: true)
var is_mock = true

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
    private var started = false
    public var userInfo: UserInfo? = nil
    
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
    static func checkLogin(email: String, password: String) -> Bool{
        if(email.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
            return false
        }
        else{
            return true
        }
    }
    
    static func setUpHealthRequest(healthStore: HKHealthStore, readSteps: @escaping () -> Void) {
        if HKHealthStore.isHealthDataAvailable(), let stepCount = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) {
            healthStore.requestAuthorization(toShare: [stepCount], read: [stepCount]) { success, error in
                if success {
                    readSteps()
                } else if error != nil {
                    // handle your error here
                }
            }
        }
        
    }
    
    static func readStepCount(forToday: Date, healthStore: HKHealthStore, completion: @escaping (Double) -> Void) {
        guard let stepQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return }
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            
            completion(sum.doubleValue(for: HKUnit.count()))
        
        }
    
        healthStore.execute(query)
        
    }
}

let manager = Manager()

func getUserInfo() async -> UserInfo? {
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
    let request = makeRequest(path: path, method: "GET")
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

func finishFoodRec() {
    // Put Request
    // user_id: int
    // food_id: int
    let path = "/food"
    
}

func getPreference() {
    let path = "/user/preference"
}

func updatePreference(breakfast: Bool, lunch: Bool, dinner: Bool, snack: Bool, dislike: [String], allergies: [String]) {
    // Put Request
    // user_id: int
    // breakfast: bool
    // lunch: bool
    // dinner: bool
    // snack: bool
    // dislike: [string, ]
    // allergies: [string, ]
    let path = "/user/preference"
    
    
}

func updateUserInfo(gender: String, age: Int, height: Int) {
    // Put Request
    // user_id: int
    // username: string
    // gender: string
    // age: int
    // height: int
    let path = "/user"
    
}

func updateUserWeight(current_weight: Double, target_weight: Double) {
    // Put Request
    // user_id: int
    // weight: float
    // target: float
    let path = "/weight"
    
}

func register(username: String, password: String) -> Bool {
    
    return true
}

func login(username: String, password: String) -> Bool {
    // If true -> getUserInfo, update userInfo to manager
    return true
}

func toFoodList(json: [[String: Any]]) -> [Food] {
    var foodList = [Food]()
    json.forEach { item in
        let food = Food(id: item["food_id"] as! Int, name: item["name"] as! String, description: item["description"] as! String, calories: item["calories"] as! Int, contains: [item["contains"] as! String], checked: (item["checked"] != nil))
        foodList.append(food)
    }
    return foodList
}

func toUserInfo(json: [String: Any]) -> UserInfo {
    let fake_food_list = [Food(id: 0, name: "Food 1", description: "Food1 Description", calories: 500, contains: ["Peanuts"], checked: false),
                          Food(id: 1, name: "Food 2", description: "Food2 Description", calories: 500, contains: ["Seafood"], checked: true)]
    return UserInfo(id: json["user_id"] as! Int, user_name: json["username"] as! String, current_weight: json["current_weight"] as! Double, target_weight: json["target_weight"] as! Double, rec_calories: json["calories_recommended"] as! Int, taken_calories: json["calories_intake"] as! Int, food_list: is_mock ? fake_food_list : toFoodList(json: json["food_list"] as! [[String : Any]]))
}
