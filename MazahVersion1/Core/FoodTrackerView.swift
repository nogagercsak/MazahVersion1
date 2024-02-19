//
//  FoodTrackerView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 2/17/24.
//

import SwiftUI

struct FoodTrackerView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Go Back to Foods!")
                    .font(Font.custom("Inter", size: 19))
                    .foregroundColor(Color(red: 0.43, green: 0.51, blue: 0.42))
                    .frame(width: 224, height: 31, alignment: .topLeading)
                    .offset(x: -30, y: -130)
                //Make this arrow align with the text
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .center)
                    .offset(x: -290, y: -133)
            } //HStack line 6.
            
            Text("🍉 Watermelon")
                .font(Font.custom("Inter", size: 48))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                .frame(width: 334, height: 94, alignment: .top)
            
            HStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 161, height: 39)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(10)
                    Text("Added: 11/1/23")
                        .font(Font.custom("Inter", size: 19))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 179, height: 24, alignment: .center)
                } //ZStack line 26.
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 161, height: 39)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(10)
                    Text("Expires 11/8/23")
                        .font(Font.custom("Inter", size: 19))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 179, height: 24, alignment: .center)
                } //ZStack line 37.
            } //HStack line 25.
            
            //First square.
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 333, height: 113)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(10)
                Text("Notes:")
                    .font(Font.custom("Inter", size: 24))
                    .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    .frame(width: 175, height: 47, alignment: .topLeading)
            } //ZStack line 51.
            
            //Second square.
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 333, height: 113)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(10)
                Text("Picture of vegi food theme:")
                    .font(Font.custom("Inter", size: 20))
                    .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    .frame(width: 175, height: 47, alignment: .topLeading)
            } //ZStack line 64.
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 119, height: 40)
                    .background(Color(red: 0.43, green: 0.51, blue: 0.42))
                    .cornerRadius(10)
                Text("Edit")
                    .font(Font.custom("Radio Canada", size: 24))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.98, green: 0.93, blue: 0.66))
                    .frame(width: 112.73684, height: 23.38461, alignment: .center)
            } //ZStack line 76.
         
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 393, height: 50)
                    .background(Color(red: 1, green: 0.96, blue: 0.89))
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -3)
                    .padding(50)
                HStack {
                    Image(systemName: "house")
                        .frame(width: 15, height: 15)
                        .padding(35)
                    Image(systemName: "plus.app")
                        .frame(width: 15, height: 15)
                        .padding(35)
                    Image(systemName: "fork.knife.circle")
                        .frame(width: 15, height: 15)
                        .padding(35)
                    Image(systemName: "person.crop.circle")
                        .frame(width: 15, height: 15)
                        .padding(35)
                } //HStack line 96.
            } //ZStack line 89.
            
        } //VStack line 5.
        .frame(width: 393, height: 852)
        .background(Color(red: 1, green: 0.96, blue: 0.89))
    }
}

#Preview {
    FoodTrackerView()
}
