//
//  TrackerManager.swift
//  MazahVersion1
//
//  Created by Ishika Meel on 2/18/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

// Define a Food struct to represent the data model
struct Food: Codable {
    @DocumentID var id: String? // Automatically generates a unique ID for each document
    var name: String
    var creationDate: String
    var foodType: String
}

// Initialize Firestore
let db = Firestore.firestore()

// Define a function to add a food item to Firestore
func addFood(name: String, creationDate: String, foodType: String) {
    let newFood = Food(name: name, creationDate: creationDate, foodType: foodType)
    
    do {
        // Add the food item to the "foods" collection
        _ = try db.collection("foods").addDocument(from: newFood)
        print("Food item added successfully.")
    } catch {
        print("Error adding food item: \(error.localizedDescription)")
    }
}

