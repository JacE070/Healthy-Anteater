//
//  HealthKitViewModel.swift
//  Healthy Anteater
//
//  Created by JacEL on 3/13/23.
// Credit: https://github.com/joricky91/TryHealthKit/blob/main/TryHealthKit/HealthKitViewModel.swift
//

import Foundation
import HealthKit

@MainActor
class HealthKitViewModel: ObservableObject {
    
    private var healthStore = HKHealthStore()
    private var healthKitManager = HealthKitManager()
    @Published var userStepCount = 8888
    @Published var isAuthorized = false
    
    init() {
        changeAuthorizationStatus()
    }
    
    //MARK: - HealthKit Authorization Request Method
    func healthRequest() {
        healthKitManager.setUpHealthRequest(healthStore: healthStore) {
            self.changeAuthorizationStatus()
            self.readStepsTakenToday()
        }
    }
    
    func changeAuthorizationStatus() {
        guard let stepQtyType = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
        let status = self.healthStore.authorizationStatus(for: stepQtyType)
        DispatchQueue.main.async {
            switch status {
            case .notDetermined:
                self.isAuthorized = false
            case .sharingDenied:
                self.isAuthorized = false
            case .sharingAuthorized:
                self.isAuthorized = true
            @unknown default:
                self.isAuthorized = false
            }
        }
    }
    
    //MARK: - Read User's Step Count
    func readStepsTakenToday() {
//        healthKitManager.readStepCount(forToday: Date(), healthStore: healthStore) { step in
//            if step != 0.0 {
//                DispatchQueue.main.async {
//                    self.userStepCount = String(format: "%.0f", step)
//                }
//            }
//        }
        DispatchQueue.main.async {
            self.userStepCount = 8888
        }
    }
    
}
