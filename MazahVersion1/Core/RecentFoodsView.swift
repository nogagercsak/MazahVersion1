//
//  RecentFoodsView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 3/2/24.
//
import SwiftUI
struct RecentFoodsView: View {
    @ObservedObject var viewModel: RecentFoodsViewModel
    var body: some View {
        VStack {
            List(viewModel.foods) { food in
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
        .onAppear {
            viewModel.fetchRecentFoods()
            print("Recent Foods: \(viewModel.foods)") // Add this line
        }
    }
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
