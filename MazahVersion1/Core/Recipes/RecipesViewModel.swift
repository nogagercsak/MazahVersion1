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
    @DocumentID var id: String?
    var title: String
    var ingredients: [String]
    var instructions: [String]
    var category: String
}


class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var filteredRecipes: [Recipe] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var db = Firestore.firestore()

    func fetchRecipes() {
        isLoading = true
        errorMessage = nil

        db.collection("recipes").getDocuments { [weak self] snapshot, error in
            guard let self = self else { return }
            
            defer {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }

            if let error = error {
                self.errorMessage = "Error fetching recipes: \(error.localizedDescription)"
                print(self.errorMessage ?? "Unknown error")
                return
            }

            if let snapshot = snapshot {
                let recipes = snapshot.documents.compactMap { document -> Recipe? in
                    do {
                        let recipe = try document.data(as: Recipe.self)
                        return recipe
                    } catch {
                        print("Error decoding recipe: \(error.localizedDescription)")
                        return nil
                    }
                }

                DispatchQueue.main.async {
                    self.recipes = recipes
                    self.filteredRecipes = recipes // Update filteredRecipes with all recipes
                    
                    // Print fetched recipes to console for debugging
                    for recipe in recipes {
                        print("Recipe Title: \(recipe.title)")
                        print("Category: \(recipe.category)")
                        print("Ingredients: \(recipe.ingredients)")
                        print("Instructions: \(recipe.instructions)")
                        print("----------")
                    }
                }
            }
        }
    }

    func filterRecipes(searchText: String) {
        if searchText.isEmpty {
            self.filteredRecipes = self.recipes
        } else {
            self.filteredRecipes = self.recipes.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
