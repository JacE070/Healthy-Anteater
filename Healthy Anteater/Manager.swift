//
//  Manager.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/5/23.
//

import Foundation

class Manager {
    private var started = false;
    
    func isStarted() -> Bool {
        return started
    }
    
    func getStarted() {
        started = true;
    }
}

let manager = Manager()
