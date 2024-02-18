//
//  SwiftUIView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 2/17/24.
//

import SwiftUI

struct Tracker1View: View {
    
    var body: some View {
        VStack {
            Text("< Go back to Foods")
                .font(Font.custom("Inter", size: 19))
                .foregroundColor(Color(red: 0.45, green: 0.68, blue: 0))
                .frame(width: 224, height: 31, alignment: .topLeading)
                .offset(x: -50, y: -170)
            Text("Foods")
              .font(Font.custom("SeH-CB", size: 65))
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
              .frame(width: 334, height: 94, alignment: .top)
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 312, height: 77)
                    .background(Color(red: 0.91, green: 0.96, blue: 0.81))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25), radius: 3.5, x: 2, y: 4)
                    .offset(x: 0, y: -10)
                VStack {
                    Text("🍉 Watermelon")
                        .font(Font.custom("Inter", size: 30))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 200, height: 40, alignment: .center)
                    Text("Added 11/1")
                        .font(Font.custom("Inter", size: 15))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 200, height: 40, alignment: .topLeading)
                } //VStack line 25.
            } //ZStack line 17.
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 312, height: 77)
                    .background(Color(red: 0.91, green: 0.96, blue: 0.81))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25), radius: 3.5, x: 2, y: 4)
                    .offset(x: 0, y: -10)
                VStack {
                    Text("🍉 Watermelon")
                        .font(Font.custom("Inter", size: 30))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 200, height: 40, alignment: .center)
                    Text("Added 11/1")
                        .font(Font.custom("Inter", size: 15))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 200, height: 40, alignment: .topLeading)
                } //VStack line 45.
            } //ZStack line 37.
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 312, height: 77)
                    .background(Color(red: 0.91, green: 0.96, blue: 0.81))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25), radius: 3.5, x: 2, y: 4)
                    .offset(x: 0, y: -10)
                VStack {
                    Text("🍉 Watermelon")
                        .font(Font.custom("Inter", size: 30))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 200, height: 40, alignment: .center)
                    Text("Added 11/1")
                        .font(Font.custom("Inter", size: 15))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 200, height: 40, alignment: .topLeading)
                } //VStack line 65.
            } //ZStack line 57.
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 312, height: 77)
                    .background(Color(red: 0.91, green: 0.96, blue: 0.81))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25), radius: 3.5, x: 2, y: 4)
                    .offset(x: 0, y: -10)
                VStack {
                    Text("🍉 Watermelon")
                        .font(Font.custom("Inter", size: 30))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 200, height: 40, alignment: .center)
                    Text("Added 11/1")
                        .font(Font.custom("Inter", size: 15))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 200, height: 40, alignment: .topLeading)
                } //VStack line 85.
            } //ZStack line 77.
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 312, height: 77)
                    .background(Color(red: 0.91, green: 0.96, blue: 0.81))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25), radius: 3.5, x: 2, y: 4)
                    .offset(x: 0, y: -10)
                VStack {
                    Text("🍉 Watermelon")
                        .font(Font.custom("Inter", size: 30))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 200, height: 40, alignment: .center)
                    Text("Added 11/1")
                        .font(Font.custom("Inter", size: 15))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 200, height: 40, alignment: .topLeading)
                } //VStack line 105.
            } //ZStack line 97.
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 312, height: 77)
                    .background(Color(red: 0.91, green: 0.96, blue: 0.81))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25), radius: 3.5, x: 2, y: 4)
                    .offset(x: 0, y: -10)
                VStack {
                    Text("🍉 Watermelon")
                        .font(Font.custom("Inter", size: 30))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 200, height: 40, alignment: .center)
                    Text("Added 11/1")
                        .font(Font.custom("Inter", size: 15))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 200, height: 40, alignment: .topLeading)
                } //VStack line 125.
            } //ZStack line 117.
            
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
                } //HStack line 144.
            } //ZStack line 137.
            
        } //VStack line 5.
        .frame(width: 393, height: 852)
        .background(Color(red: 1, green: 0.96, blue: 0.89))
    }
}

#Preview {
    Tracker1View()
}
