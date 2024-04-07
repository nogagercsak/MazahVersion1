//
//  FoodDriveDetailView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/7/24.
//

import SwiftUI
import MapKit

struct FoodDriveDetailView: View {
    let foodDrive: FoodDrive

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(foodDrive.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            Text("Description:")
                .font(.headline)
                .padding(.horizontal)
            
            Text(foodDrive.description)
                .padding(.horizontal)
            
            Text("Address:")
                .font(.headline)
                .padding(.horizontal)
            
            Text(foodDrive.address)
                .padding(.horizontal)
            
            Text("Contact:")
                .font(.headline)
                .padding(.horizontal)
            
            Text(foodDrive.contact)
                .padding(.horizontal)
            
            Spacer()
        }
        .navigationBarTitle("Food Drive Details")
        .padding()
    }
}

struct FoodDriveDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleFoodDrive = FoodDrive(
            name: "Sample Food Drive",
            description: "This is a sample description for the food drive.",
            location: GeoPoint(latitude: 37.123, longitude: -122.456),
            address: "123 Main St, City, State, Zip",
            contact: "Contact Person"
        )
        return NavigationView {
            FoodDriveDetailView(foodDrive: sampleFoodDrive)
        }
    }
}

