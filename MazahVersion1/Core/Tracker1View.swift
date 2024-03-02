//
//  SwiftUIView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 2/17/24.
//

import SwiftUI
struct FoodItem: Identifiable {
    var id = UUID()
    var name: String
    var addedDate: String
}
struct FoodsView: View {
    let foods: [FoodItem] = [
        FoodItem(name: "Watermelon", addedDate: "11/1"),
        FoodItem(name: "Apple", addedDate: "11/2"),
        FoodItem(name: "Banana", addedDate: "11/3"),
        FoodItem(name: "Orange", addedDate: "11/4"),
        FoodItem(name: "Grapes", addedDate: "11/5")
    ]
    var body: some View {
        NavigationView {
            List(foods) { food in
                FoodItemRow(foodItem: food)
            }
            .navigationBarTitle("Foods")
        }
    }
}
struct FoodItemRow: View {
    var foodItem: FoodItem
    
    var body: some View {
        VStack {
            HStack {
                Text(foodItem.name)
                    .font(Font.custom("Inter", size: 20))
                    .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                Spacer()
                Text("Added \(foodItem.addedDate)")
                    .font(Font.custom("Inter", size: 15))
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 10)
    }
}

struct Tracker1View_Previews: PreviewProvider {
    static var previews: some View {
        FoodsView()
    }
}

