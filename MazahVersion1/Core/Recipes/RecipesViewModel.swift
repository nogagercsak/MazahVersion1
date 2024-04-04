//
//  RecipesViewModel.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/4/24.
//

import Foundation
import Combine
import FirebaseFirestore

struct Recipe: Identifiable, Codable {
    var id: String?
    var title: String
    var ingredients: [String]
    var instructions: String
    var category: String
}


class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []

    private var db = Firestore.firestore()

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
                              let ingredients = recipeData["ingredients"] as? [String],
                              let instructions = recipeData["instructions"] as? String,
                              let category = recipeData["category"] as? String else {
                            // Missing required fields
                            return nil
                        }

                        let recipe = Recipe(title: title, ingredients: ingredients, instructions: instructions, category: category)
                        return recipe
                    } catch {
                        print("Error decoding recipe: \(error.localizedDescription)")
                        return nil
                    }
                }

                DispatchQueue.main.async {
                    self.recipes = recipes
                }
            }
        }
    }
}

