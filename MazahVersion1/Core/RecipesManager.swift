//
//  RecipesManager.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/4/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class RecipesManager: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    let db = Firestore.firestore()

    func fetchRecipes() {
        db.collection("recipes").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching recipes: \(error.localizedDescription)")
                return
            }

            if let snapshot = snapshot {
                let recipes = snapshot.documents.compactMap { document -> Recipe? in
                    do {
                        var recipeData = document.data()
                        guard let title = recipeData["title"] as? String,
                              let instructions = recipeData["instructions"] as? [String],
                              let category = recipeData["category"] as? String,
                              let ingredients = recipeData["ingredients"] as? [String] else {
                            return nil
                        }

                        let recipe = Recipe(title: title, ingredients: ingredients, instructions: instructions, category: category)
                        return recipe
                    } catch {
                        print("Error decoding recipe: \(error.localizedDescription)")
                        return nil
                    }
                }

                // Now 'recipes' contains an array of Recipe objects
                for recipe in recipes {
                    print("Recipe: \(recipe.title)")
                    print("Ingredients: \(recipe.ingredients)")
                    print("Instructions: \(recipe.instructions)")
                    print("Category: \(recipe.category)")
                    print("-----------------------------")
                }
            }
        }
    }

}
