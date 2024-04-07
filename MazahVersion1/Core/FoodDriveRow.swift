//
//  FoodDriveRow.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/6/24.
//

import SwiftUI

struct FoodDriveRow: View {
    @Binding var foodDrive: FoodDrive

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
    @State static var foodDrive: FoodDrive = FoodDrive(name: "Food Drive", description: "Description", location: GeoPoint(latitude: 37.123, longitude: -122.456), address: "123 Main St, City, State, Zip", contact: "Contact")

    static var previews: some View {
        FoodDriveRow(foodDrive: $foodDrive)
    }
}
