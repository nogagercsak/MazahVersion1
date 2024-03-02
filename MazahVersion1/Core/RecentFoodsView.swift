//
//  RecentFoodsView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 3/2/24.
//

import SwiftUI

struct RecentFoodsView: View {
    @ObservedObject var viewModel: RecentFoodsViewModel
    @State private var selectedFood: Food? = nil
    @State private var showFoodTrackerView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.foods) { food in
                    Button(action: {
                        self.selectedFood = food
                        self.showFoodTrackerView = true
                    }) {
                        VStack(alignment: .leading) {
                            Text(food.name)
                                .font(.headline)
                            Text("Expiration Date: \(formattedDate(food.expDate))")
                                .font(.subheadline)
                            Text("Food Type: \(food.foodType)")
                                .font(.subheadline)
                        }
                        .padding(.vertical, 8)
                    }
                }
                .navigationTitle("Recent Foods")
                .sheet(isPresented: $showFoodTrackerView) {
                    if let selectedFood = selectedFood {
                        FoodTrackerView(food: selectedFood)
                    }
                }
                .onAppear {
                    viewModel.fetchRecentFoods()
                }
            }
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
