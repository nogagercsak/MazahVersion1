//
//  RecipeDetailView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/4/24.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(recipe.title)
                        .font(.title)
                        .padding(.bottom, 8)

                    Text("Ingredients:")
                        .font(.headline)
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("• \(ingredient)")
                    }

                    Text("Instructions:")
                        .font(.headline)
                    ForEach(recipe.instructions, id: \.self) { instruction in
                        Text("• \(instruction)")
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle(recipe.title)
        }
    }

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleRecipe = Recipe(
            id: "1",
            title: "Spaghetti Carbonara",
            ingredients: ["Spaghetti", "Eggs", "Parmesan cheese", "Pancetta", "Black pepper", "Salt"],
            instructions: ["1. Cook spaghetti in salted water..."],
            category: "pasta"
        )
        return RecipeDetailView(recipe: sampleRecipe)
    }
}
