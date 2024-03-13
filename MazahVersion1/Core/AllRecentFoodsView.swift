
//
//  AllRecentFoodsView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 3/12/24.
//
import SwiftUI
struct AllRecentFoodsView: View {
    @ObservedObject var viewModel: RecentFoodsViewModel
    var body: some View {
        VStack {
            List(viewModel.foods) { food in
                NavigationLink(destination: FoodTrackerView(food: food)) {
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
            .navigationTitle("All Recent Foods")
        }
        .onAppear {
            viewModel.fetchRecentFoods()
        }
    }
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
