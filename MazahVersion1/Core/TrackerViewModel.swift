//
//  TrackerViewModel.swift
//  MazahVersion1
//
//  Created by Ishika Meel on 2/19/24.
//

// Food.swift
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Food: Codable {
    @DocumentID var id: String? // Automatically generates a unique ID for each document
    var name: String
    var creationDate: Date
    var expDate: Date
    var foodType: String
    var reminder: Bool
}


