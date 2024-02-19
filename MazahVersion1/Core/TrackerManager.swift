//
//  TrackerManager.swift
//  MazahVersion1
//
//  Created by Ishika Meel on 2/18/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
final class AddFoodViewModel: ObservableObject {
    
    @Published var foodName: String = ""
    @Published var creationDate = Date()
    @Published var expirationDate = Date()
    @Published var remindMe = false
    @Published var notesVar: String = ""
    
    func addFood() {
        let newFood = Food(name: foodName, creationDate: creationDate, expDate: expirationDate, foodType: "Type", reminder: remindMe);        FirestoreManager.shared.addFood(newFood)
    }}


struct FirestoreManager {
    static let shared = FirestoreManager() // Singleton instance
    
    private let db = Firestore.firestore()
    
    func addFood(_ food: Food) {
        do {
            // Add the food item to the "foods" collection
            _ = try db.collection("foods").addDocument(from: food)
            print("Food item added successfully.")
        } catch {
            print("Error adding food item: \(error.localizedDescription)")
        }
    }
}

