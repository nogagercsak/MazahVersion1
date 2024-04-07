//
//  HomeView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 3/5/24.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showSignInView: Bool
    @State private var foodDrives: [FoodDrive] = [
            FoodDrive(name: "Food Drive 1", description: "Description 1", location: GeoPoint(latitude: 37.123, longitude: -122.456), address: "123 Main St, City, State, Zip", contact: "Contact 1"),
            FoodDrive(name: "Food Drive 2", description: "Description 2", location: GeoPoint(latitude: 37.456, longitude: -122.789), address: "456 Elm St, City, State, Zip", contact: "Contact 2")
        ]

    var body: some View {
            NavigationView {
                VStack {
                    Text("Welcome to Mazah!")
                        .font(.custom("SeoulHangang B", size: 50))
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: TrackerHomeView( showSignInView: $showSignInView)) {
                        Text("Food Tracker")
                            .font(Font.custom("Radio Canada", size: 18))
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: RecipeListView()) {
                        Text("Recipes")
                            .font(Font.custom("Radio Canada", size: 18))
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: FoodDriveView(foodDrives: $foodDrives)) {
                        Text("Donate Food")
                            .font(Font.custom("Radio Canada", size: 18))
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Spacer()
                    
                    NavBar(showSignInView: $showSignInView)
                }
                .navigationBarTitle("Home", displayMode: .inline)
            }
        
        }
}

#Preview {
    HomeView(showSignInView: .constant(false))
}
