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
                        .font(.title)
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: TrackerHomeView( showSignInView: $showSignInView)) {
                        Text("Food Tracker")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                  //  NavigationLink(destination: ()) { // here we add reciped view
                        Text("Recipes")
                            .font(.headline)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(8)
               //     }
                    
              //      NavigationLink(destination:()) { //here we add donate view
                        Text("Donate")
                            .font(.headline)
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
