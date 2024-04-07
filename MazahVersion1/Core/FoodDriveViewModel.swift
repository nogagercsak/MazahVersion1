//
//  FoodDriveViewModel.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/6/24.
//

import SwiftUI

class FoodDriveViewModel: ObservableObject {
    @Published var foodDrives: [FoodDrive] = []
    
    func fetchNearbyFoodDrives() {
        // Call the function to fetch food drives
        FoodDriveManager.shared.fetchNearbyFoodDrives { foodDrives in
            DispatchQueue.main.async {
                self.foodDrives = foodDrives
            }
        }
    }
}
