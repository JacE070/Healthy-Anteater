//
//  Manager.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/5/23.
//

import Foundation

const mock_api = "https://my.api.mockaroo.com/"
const mock_api_key = "3a9bab50"

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
