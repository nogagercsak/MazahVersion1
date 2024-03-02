//
//  ProfileView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 11/29/23.
//

import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject{
    
    @Published private(set) var user: DBUser? = nil
    
    func loadCurrentUser() async throws{
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
    func addUserFood(text: String) {
        guard let user else { return }
        
        Task {
            try await UserManager.shared.addUserFood(userId: user.userId, food: text)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func removeUserFood(text: String) {
        guard let user else { return }
        
        Task {
            try await UserManager.shared.removeUserFood(userId: user.userId, food: text)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func addFavVegetable() {
        guard let user else { return }
        let vegetable = Vegetable(id: "1", title: "Spinach", recentlyBought: true)
        Task {
            try await UserManager.shared.addFavVegetable(userId: user.userId, vegetable: vegetable)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func removeFavVegetable() {
        guard let user else { return }
        Task {
            try await UserManager.shared.removeFavVegetable(userId: user.userId)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }

    
}

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @Binding var showSignInView: Bool
    
    let foodOptions: [String] = ["Dairy", "Produce", "Meat"]
    
    private func foodIsSelected(text: String) -> Bool {
        viewModel.user?.food?.contains(text) ==  true
    }
    
    var body: some View {
        List{
            if let user = viewModel.user{
                Text("UserId: \(user.userId)")
                
                if let email = user.email{
                    Text("Email: \(email.description)")
                }
                VStack{
                    HStack{
                        ForEach(foodOptions, id:  \.self) { string in
                            Button(string){
                                if foodIsSelected(text: string){
                                    viewModel.removeUserFood(text: string)
                                } else {
                                    viewModel.addUserFood(text: string)
                                }
                                viewModel.addUserFood(text: string)
                            }
                            .font(.headline)
                            .buttonStyle(.borderedProminent)
                            .tint(foodIsSelected(text: string) ?.green : .red)
                        }
                    }
                    
                    Text("Foods: \((user.food ?? []).joined(separator: ", "))")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Button {
                    if user.favVegetable == nil {
                        viewModel.addFavVegetable()
                    } else {
                        viewModel.removeFavVegetable()
                    }
                } label: {
                    Text("Favorite Vegetable: \((user.favVegetable?.title ?? ""))")
                }
                
            }
        }
        .task{
            try? await viewModel.loadCurrentUser()
        }
        .navigationTitle("Profile")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                NavigationLink {
                    SettingsView(showSignInView: $showSignInView)
                } label: {
                    Image(systemName: "gear")
                        .font(.headline)
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                NavigationLink {
                    TrackerHomeView()
                } label: {
                    Text("Tracker")
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
