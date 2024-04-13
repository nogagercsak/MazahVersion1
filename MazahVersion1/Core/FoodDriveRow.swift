//
//  FoodDriveRow.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/13/24.
//

import SwiftUI
import FirebaseFirestore

struct FoodDriveRow: View {
    var foodDrive: FoodDrive

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(foodDrive.name)
                .font(.headline)
            
            Text(foodDrive.address)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct FoodDriveRow_Previews: PreviewProvider {
    static var previews: some View {
        let sampleFoodDrive = FoodDrive(id: "1", name: "Sample Food Drive", contact: "Contact Info", address: "123 Sample St", description: "Sample Description", geolocation: GeoPoint(latitude: 0, longitude: 0))
        return FoodDriveRow(foodDrive: sampleFoodDrive)
    }
}
