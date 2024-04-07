//
//  FoodDriveManager.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct FoodDrive: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let location: GeoPoint
    let address: String
    let contact: String
    
    init(name: String, description: String, location: GeoPoint, address: String, contact: String) {
        self.name = name
        self.description = description
        self.location = location
        self.address = address
        self.contact = contact
    }
}

class FoodDriveManager {
    static let shared = FoodDriveManager()
    private let db = Firestore.firestore()
    
    func fetchNearbyFoodDrives(completion: @escaping ([FoodDrive]) -> Void) {
        guard let userLocation = LocationManager.shared.currentLocation else {
            completion([])
            return
        }
        
        let foodDrivesRef = db.collection("food_drives")
        
        let radiusInMeters: Double = 10000 // 10km
        let center = GeoPoint(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        let query = foodDrivesRef.whereField("geolocation", isEqualTo: center)
        
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting food drives: \(error)")
                completion([])
            } else {
                var foodDrives: [FoodDrive] = []
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let foodDrive = FoodDrive(
                        name: data["name"] as? String ?? "",
                        description: data["description"] as? String ?? "",
                        location: data["geolocation"] as? GeoPoint ?? GeoPoint(latitude: 0, longitude: 0),
                        address: data["address"] as? String ?? "",
                        contact: data["contact"] as? String ?? ""
                    )
                    foodDrives.append(foodDrive)
                }
                completion(foodDrives)
            }
        }
    }
}
