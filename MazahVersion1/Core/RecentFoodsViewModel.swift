
//
//  RecentFoodsViewModel.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 3/2/24.
//
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine
import FirebaseAuth
class RecentFoodsViewModel: ObservableObject {
    @Published var foods: [Food] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let db = Firestore.firestore()
    
    func fetchRecentFoods() {
        guard let userId = Auth.auth().currentUser?.uid else {
            // Handle error: User is not logged in
            return
        }
        
        db.collection("users").document(userId).collection("foods")
            .order(by: "creationDate", descending: true) // Assuming creationDate is a field in your Food model
            .limit(to: 10) // Limit to 10 recent foods, you can adjust as needed
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching recent foods: \(error.localizedDescription)")
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.foods = documents.compactMap { document in
                    do {
                        let food = try document.data(as: Food.self)
                        return food
                    } catch {
                        print("Error decoding food: \(error.localizedDescription)")
                        return nil
                    }
                }
            }
    }
    
    func deleteFood(food: Food) {
           guard let userId = Auth.auth().currentUser?.uid, let foodId = food.id else {
               return
           }
           
           FirestoreManager.shared.deleteFood(forUser: userId, foodId: foodId) { error in
               if let error = error {
                   print("Error deleting food: \(error.localizedDescription)")
               } else {
                   print("Food deleted successfully!")
                   // Handle any updates after deletion, like fetching updated list
               }
           }
       }
   }
