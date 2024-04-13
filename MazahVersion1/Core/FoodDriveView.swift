//
//  FoodDriveView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/13/24.
//

import SwiftUI

struct FoodDriveView: View {
    
    @StateObject private var viewModel = FoodDrivesViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.foodDrives) { foodDrive in
                    NavigationLink(destination: FoodDriveDetailView(foodDrive: foodDrive)) {
                        FoodDriveRow(foodDrive: foodDrive)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .onAppear {
            viewModel.fetchFoodDrives()
        }
    }
}




