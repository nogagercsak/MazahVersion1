//
//  ProfileView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 11/29/23.
//

import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject{
    
    @Published private(set) var user: AuthDataResultModel? = nil
    
    func loadCurrentUser() throws{
        self.user = try AuthenticationManager.shared.getAuthenticatedUser()
    }
    
}

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List{
            if let user = viewModel.user{
                Text("UserId: \(user.uid)")
            }
        }
        .onAppear{
            try? viewModel.loadCurrentUser()
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
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ProfileView(showSignInView: .constant(false ))
        }
    }
}
