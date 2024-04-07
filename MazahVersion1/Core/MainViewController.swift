//
//  MainViewController.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/6/24.
//

import UIKit

class MainViewController: UIViewController {
    
    let mapViewController = MapViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch nearby food drives
        fetchNearbyFoodDrives()
    }
    
    func fetchNearbyFoodDrives() {
        // Call the function to fetch food drives
        fetchNearbyFoodDrives { [weak self] foodDrives in
            self?.mapViewController.foodDrives = foodDrives
        }
    }
    
    func fetchNearbyFoodDrives(completion: @escaping ([FoodDrive]) -> Void) {
        // Your existing fetch function
        // Just ensure to call the completion handler with fetched food drives
        FoodDriveManager.shared.fetchNearbyFoodDrives { foodDrives in
            completion(foodDrives)
        }
    }
}
