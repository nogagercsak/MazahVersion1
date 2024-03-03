//
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
            VStack {
                NavigationLink(destination: AddFoodView(showAddFoodView: .constant(true))) {
                    Text("Add Food")
                }
                RecentFoodsView(viewModel: recentFoodsViewModel)
                    .padding()
                Spacer()
                
                NavBar(showSignInView: $showSignInView)
            }
            .navigationTitle("My Foods")
        }
    }
}

struct TrackerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerHomeView(showSignInView: .constant(true))
    }
}
