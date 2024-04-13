//
//  FoodViewDetailView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/13/24.
//


import SwiftUI
import FirebaseFirestore

struct FoodDriveDetailView: View {
    var foodDrive: FoodDrive

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
        }
        .navigationBarTitle("Food Drive Details")
        .padding()
    }
}

struct FoodDriveDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleFoodDrive = FoodDrive(id: "1", name: "Sample Food Drive", contact: "Contact Info", address: "123 Sample St", description: "Sample Description", geolocation: GeoPoint(latitude: 0, longitude: 0))
        return FoodDriveDetailView(foodDrive: sampleFoodDrive)
    }
}
