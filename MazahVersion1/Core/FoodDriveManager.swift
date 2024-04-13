//
//  FoodDriveManager.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/13/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class FoodDriveManager: ObservableObject {
    
    @Published var foodDrives: [FoodDrive] = []
    
    let db = Firestore.firestore()

    func fetchFoodDrives() {
        db.collection("food_drives").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching food drives: \(error.localizedDescription)")
                return
            }

            if let snapshot = snapshot {
                let fetchedFoodDrives = snapshot.documents.compactMap { document -> FoodDrive? in
                    let foodDriveData = document.data()
                    print("Food Drive Data: \(foodDriveData)")
                    do {
                        var decodedFoodDrive = try document.data(as: FoodDrive.self)
                        // Handle GeoPoint decoding
                        if let geoPoint = foodDriveData["geolocation"] as? GeoPoint {
                            decodedFoodDrive.geolocation = geoPoint
                        }
                        return decodedFoodDrive
                    } catch {
                        print("Error decoding food drive: \(error.localizedDescription)")
                        return nil
                    }
                }
                DispatchQueue.main.async {
                    self.foodDrives = fetchedFoodDrives
                }
            }
        }
    }
}

