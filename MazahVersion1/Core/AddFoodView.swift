//
//  AddFoodView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 2/17/24.
//

import SwiftUI
import FirebaseAuth


struct AddFoodView: View {
    
    @StateObject private var viewModel = AddFoodViewModel()
    @Binding var showAddFoodView: Bool
    
    var body: some View {
        VStack {
            Text("< Go back to Foods")
                .font(Font.custom("Inter", size: 19))
                .foregroundColor(Color(red: 0.45, green: 0.68, blue: 0))
                .frame(width: 224, height: 31, alignment: .topLeading)
                .padding(.top, -170)
            
            Text("Food!")
                .font(Font.custom("Radio Canada", size: 45))
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                .padding(.top, -100)
            
            ScrollView {
                VStack {
                    Section(header: Text("Food Details")) {
                        TextField("Food Name", text: $viewModel.foodName)
                        TextField("Notes", text: $viewModel.notesVar)
                    }
                    
                    Section(header: Text("Expiration")) {
                        DatePicker("Added Date", selection: $viewModel.creationDate, displayedComponents: .date)
                        DatePicker("Expiration Date", selection: $viewModel.expirationDate, displayedComponents: .date)
                        
                        Toggle("Remind me when", isOn: $viewModel.remindMe)
                    }
                }
                .padding()
                .padding(.top, 100)
            }
            
            Button(action: {
                guard let userId = Auth.auth().currentUser?.uid else {
                    // Handle error: User is not logged in
                    return
                }
                viewModel.addFood(forUser: userId)
                showAddFoodView = false
            }) {
                Text("Save")
                    .font(Font.custom("Radio Canada", size: 24))
                    .foregroundColor(Color(red: 0.98, green: 0.93, blue: 0.66))
                    .frame(width: 112.73684, height: 40, alignment: .center)
                    .background(Color(red: 0.43, green: 0.51, blue: 0.42))
                    .cornerRadius(30)
                    .padding(.bottom, 90)
            }
        }
        .padding(30)
        .frame(width: 393, height: 852)
        .background(Color(red: 1, green: 0.96, blue: 0.89))
        .onReceive(viewModel.addedFood) { food in
            // This closure will be called when a new food item is added to Firestore
            print("Added Food: \(food.name)")
        }
    }
}


struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView(showAddFoodView: .constant(true))
    }
}
