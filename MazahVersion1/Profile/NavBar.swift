//
//  NavBar.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 3/2/24.
//

import SwiftUI

struct NavBar: View {
    
    @Binding var showSignInView: Bool

    var body: some View {
        NavigationStack{
            HStack(spacing: 40) { // Adjust spacing between buttons here
                NavigationLink(destination: ProfileView(showSignInView: .constant(true))) {
                    Image(systemName: "person.crop.circle")
                        .font(.title)
                }
                .padding(.leading, 20)
                
                Spacer()
                
                NavigationLink(destination: TrackerHomeView()) {
                    Image(systemName: "list.bullet")
                        .font(.title)
                }
                
                Spacer()
                
                NavigationLink(destination: SettingsView(showSignInView: $showSignInView)) {
                    Image(systemName: "gearshape")
                        .font(.title)
                }
                .padding(.trailing, 20)
            }
            .foregroundColor(.primary)
            .padding(.top, 20)
            .frame(height: 60)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
        }
    }
}

struct CustomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(showSignInView: .constant(true))
    }
}
