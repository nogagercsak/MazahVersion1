//
//  RecipeListView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/4/24.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipesViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search Recipes")
                    .padding(.horizontal)

                List(filteredRecipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        VStack(alignment: .leading) {
                            Text(recipe.title)
                                .font(.headline)
                            Text("Category: \(recipe.category)")
                                .font(.subheadline)
                        }
                    }
                }
                .navigationTitle("Recipes")
            }
            .onAppear {
                viewModel.fetchRecipes()
            }
        }
    }

    private var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return viewModel.recipes
        } else {
            return viewModel.recipes.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
}

