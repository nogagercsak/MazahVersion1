//
//  FirstView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 11/29/23.
//


import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Mazah")
                    .font(.custom("SeH-CB", size: 95))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    .fontWeight(.bold)
                    .frame(width: 400, height: 76, alignment: .top)
                    .offset(x: 0, y: -40)
                
                Text("Start your food saving journey today.")
                    .font(.custom("SeH-CB", size: 22))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    .frame(width: 237, height: 52, alignment: .center)
                    .offset(x: 0, y: -20)
                
                NavigationLink(destination: RootView()) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 350, height: 50)
                            .background(Color(red: 0.43, green: 0.51, blue: 0.42))
                            .cornerRadius(30)
                        
                        Text("Start")
                            .font(.custom("SeH-CB", size: 25))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.98, green: 0.93, blue: 0.66))
                            .frame(width: 100, height: 35, alignment: .center)
                    } // ZStack line 25.
                    .offset(x: 0, y: 15)
                }
                
            } // VStack line 12.
            .frame(width: 393, height: 852)
            .background(
                Image("gradient")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 393, height: 900)
                    .clipped()
            )
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
