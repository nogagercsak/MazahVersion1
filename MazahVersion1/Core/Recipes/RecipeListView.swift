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

                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.filteredRecipes) { recipe in
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
            }
            .onAppear {
                viewModel.fetchRecipes()
            }
            .onChange(of: searchText) { newSearchText in
                viewModel.filterRecipes(searchText: newSearchText)
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
