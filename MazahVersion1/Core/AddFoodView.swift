//
//  AddFoodView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 2/17/24.
//

import SwiftUI

struct AddFoodView: View {
    var body: some View {
        VStack {
            Text("< Go back to Foods")
                .font(Font.custom("Inter", size: 19))
                .foregroundColor(Color(red: 0.45, green: 0.68, blue: 0))
                .frame(width: 224, height: 31, alignment: .topLeading)
                .offset(x: -50, y: -170)
            
            Text("Food")
                .font(Font.custom("Radio Canada", size: 45))
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                .frame(width: 186, height: 15, alignment: .top)
                .offset(x: -110, y: -100)
            
            //First rectangle.
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 338, height: 107)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(10)
                    .offset(x: 0, y: -60)
                VStack {
                    Text("Food Name")
                        .font(Font.custom("Inter", size: 19))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 179, height: 24, alignment: .topLeading)
                        .offset(x: -55, y: -60)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 307.9993, height: 1)
                        .background(.white)
                        .offset(x: 0, y: -60)
                    Text("Notes")
                        .font(Font.custom("Inter", size: 19))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                        .frame(width: 179, height: 24, alignment: .topLeading)
                        .offset(x: -55, y: -60)
                } //VStack line 26.
            } //ZStack line 19.
            
            Text("Expiration")
                .font(Font.custom("Radio Canada", size: 45))
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                .frame(width: 400, height: 15, alignment: .top)
                .offset(x: -60, y: -40)
            
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 338, height: 152)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(10)
                VStack {
                    HStack {
                        Text("Added Date")
                            .font(Font.custom("Inter", size: 19))
                            .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                            .frame(width: 179, height: 24, alignment: .topLeading)
                            .offset(x: 10, y: 0)
                        ZStack {
                            Image("Rectangle 46")
                                .frame(width: 117, height: 38)
                                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                            Text("Nov 7, 2023")
                                .font(Font.custom("Inter", size: 17))
                                .foregroundColor(.black)
                                .frame(width: 127, height: 22, alignment: .top)
                        } //ZStack line 64.
                    } //HStack line 58.
                    
                    //White line in between two HStacks.
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 307.9993, height: 1)
                        .background(.white)
                    HStack {
                        Text("Expiration Date")
                            .font(Font.custom("Inter", size: 19))
                            .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                            .frame(width: 179, height: 24, alignment: .topLeading)
                            .offset(x: 10, y: 0)
                        ZStack {
                            Image("Rectangle 46")
                                .frame(width: 117, height: 38)
                                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                            Text("Nov 8, 2023")
                                .font(Font.custom("Inter", size: 17))
                                .foregroundColor(.black)
                                .frame(width: 127, height: 22, alignment: .top)
                        } //ZStack line 86.
                    } //HStack line 80.
                    
                    HStack {
                        Text("Remind me when ")
                            .font(Font.custom("Inter", size: 19))
                            .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                            .frame(width: 275, height: 24, alignment: .topLeading)
                            .offset(x: 15, y: 0)
                        ZStack {
                            Image("Rectangle 47")
                                .frame(width: 52, height: 24)
                                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                            Image("Ellipse 4")
                                .frame(width: 25, height: 24)
                                .background(Color(red: 0.72, green: 0.72, blue: 0.72))
                        } //ZStack line 103.
                    } //HStack line 97.
                } //VStack line 57.
            } //ZStack line 51.
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 119, height: 40)
                    .background(Color(red: 0.43, green: 0.51, blue: 0.42))
                    .cornerRadius(30)
                    .offset(x: 0, y: 40)
                Text("Save")
                    .font(Font.custom("Radio Canada", size: 24))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.98, green: 0.93, blue: 0.66))
                    .frame(width: 112.73684, height: 23.38461, alignment: .center)
                    .offset(x: 0, y: 40)
            } //ZStack line 115.
         
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
                } //HStack line 137.
            } //ZStack line 130.
            
        } //VStack line 5.
        .frame(width: 393, height: 852)
        .background(Color(red: 1, green: 0.96, blue: 0.89))
    }
}

#Preview {
    AddFoodView()
}
