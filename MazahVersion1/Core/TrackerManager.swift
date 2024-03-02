//
//  TrackerManager.swift
//  MazahVersion1
//
//  Created by Ishika Meel on 2/18/24.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

final class AddFoodViewModel: ObservableObject {
    @Published var foodName: String = ""
    @Published var creationDate = Date()
    @Published var expirationDate = Date()
    @Published var remindMe = false
    @Published var notesVar: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    var addedFood = PassthroughSubject<Food, Never>()
    
    func addFood(forUser userId: String) {
        let newFood = Food(name: foodName, creationDate: creationDate, expDate: expirationDate, foodType: "Type", reminder: remindMe)
        FirestoreManager.shared.addFood(forUser: userId, newFood) { [weak self] result in
            switch result {
            case .success(let food):
                self?.addedFood.send(food)
            case .failure(let error):
                print("Error adding food item: \(error.localizedDescription)")
            }
        }
    }
}


enum FirestoreError: Error {
    case documentCreationError
}

class FirestoreManager {
    static let shared = FirestoreManager() // Singleton instance
    private let db = Firestore.firestore()
    
    func addFood(forUser userId: String, _ food: Food, completion: @escaping (Result<Food, Error>) -> Void) {
        do {
            // Add the food item to the "foods" subcollection of the user
            _ = try db.collection("users").document(userId).collection("foods").addDocument(from: food) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(food))
                }
            }
        } catch {
            completion(.failure(FirestoreError.documentCreationError))
        }
    }
}
