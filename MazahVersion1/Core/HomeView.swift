//
//  HomeView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 3/5/24.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showSignInView: Bool


    var body: some View {
            NavigationView {
                VStack {
                    Text("Welcome to Mazah!")
                        .font(.custom("SeoulHangang B", size: 50))
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: TrackerHomeView( showSignInView: $showSignInView)) {
                        Text("Food Tracker")
                            .font(Font.custom("Radio Canada", size: 18))
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: RecipeListView()) { // here we add reciped view
                        Text("Recipes")
                            .font(Font.custom("Radio Canada", size: 18))
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
              //      NavigationLink(destination:()) { //here we add donate view
                        Text("Donate")
                            .font(Font.custom("Radio Canada", size: 18))
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
             //       }
                    
                    Spacer()
                    
                    NavBar(showSignInView: $showSignInView)
                }
                .navigationBarTitle("Home", displayMode: .inline)
            }
        
        }
}

#Preview {
    HomeView(showSignInView: .constant(false))
}
