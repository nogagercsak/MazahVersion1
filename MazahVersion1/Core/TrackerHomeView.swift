//  TrackerHomeView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 3/2/24.
//
import SwiftUI
struct TrackerHomeView: View {
    @StateObject var recentFoodsViewModel = RecentFoodsViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header
                Text("Tracker")
                    .font(Font.custom("SeoulHangang B", size: 40))
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                // Recent Foods Preview
                Section(header: Text("Recent Foods").font(.headline)) {
                    RecentFoodsPreview(viewModel: recentFoodsViewModel)
                }
                .padding(.horizontal)
                // Buttons
                NavigationLink(destination: AllRecentFoodsView(viewModel: recentFoodsViewModel)) {
                    StandardButton(title: "View All Recent Foods")
                }
                NavigationLink(destination: AddFoodView(showAddFoodView: .constant(true), showSignInView: $showSignInView)) {
                    StandardButton(title: "Add Food")
                }
                Spacer()
                // Navigation Bar
                NavBar(showSignInView: $showSignInView)
            }
            .padding(.horizontal)
            .navigationTitle("Tracker")
        }
    }
}
struct TrackerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerHomeView(showSignInView: .constant(true))
    }
}
struct RecentFoodsPreview: View {
    @ObservedObject var viewModel: RecentFoodsViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(viewModel.foods.prefix(3)) { food in
                VStack(alignment: .leading, spacing: 5) {
                    Text(food.name)
                        .font(.headline)
                    Text("Expiration Date: \(formattedDate(food.expDate))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Food Type: \(food.foodType)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 8)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(red: 0.98, green: 0.96, blue: 0.89)))
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
struct StandardButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(red: 0.43, green: 0.51, blue: 0.42))
            .cornerRadius(10)
    }
}
