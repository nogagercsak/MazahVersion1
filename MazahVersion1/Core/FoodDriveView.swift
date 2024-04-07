//
//  FoodDriveView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/6/24.
//

import SwiftUI


struct FoodDriveView: View {
    @Binding var foodDrives: [FoodDrive]

    var body: some View {
        VStack {
            List {
                ForEach($foodDrives) { $foodDrive in
                    FoodDriveRow(foodDrive: $foodDrive)
                }
            }
            MapView(foodDrives: $foodDrives)
                .frame(height: 400)
                .padding()
        }
    }
}

struct FoodDriveView_Previews: PreviewProvider {
    @State static var foodDrives: [FoodDrive] = [
        FoodDrive(name: "Food Drive 1", description: "Description 1", location: GeoPoint(latitude: 37.123, longitude: -122.456), address: "123 Main St, City, State, Zip", contact: "Contact 1"),
        FoodDrive(name: "Food Drive 2", description: "Description 2", location: GeoPoint(latitude: 37.456, longitude: -122.789), address: "456 Elm St, City, State, Zip", contact: "Contact 2")
    ]

    static var previews: some View {
        FoodDriveView(foodDrives: $foodDrives)
    }
}



