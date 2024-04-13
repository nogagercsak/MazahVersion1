//
//  FoodDrivesViewModel.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/13/24.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift


struct FoodDrive: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var contact: String
    var address: String
    var description: String
    var geolocation: GeoPoint
}


class FoodDrivesViewModel: ObservableObject {
    @Published var foodDrives: [FoodDrive] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var foodDriveManager = FoodDriveManager()
    private var cancellables: Set<AnyCancellable> = []

    func fetchFoodDrives() {
        isLoading = true
        errorMessage = nil

        foodDriveManager.fetchFoodDrives()

        // Observing changes in FoodDriveManager's foodDrives
        foodDriveManager.$foodDrives
            .receive(on: DispatchQueue.main)
            .sink { [weak self] fetchedFoodDrives in
                self?.isLoading = false
                self?.foodDrives = fetchedFoodDrives
            }
            .store(in: &cancellables)
    }
}
