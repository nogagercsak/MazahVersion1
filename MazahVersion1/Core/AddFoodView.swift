//
//  AddFoodView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 2/17/24.
//

import SwiftUI

@MainActor
final class AddFoodViewModel: ObservableObject {
    @Published var foodName: String = ""
    @Published var creationDate = Date()
    @Published var expirationDate = Date()
    @Published var remindMe = false
    @Published var notesVar: String = "" // Add this line
    
    func addFood() {
        // Call your Firestore addFood function here using the provided data
    }
}

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
            
            Section(header: Text("Food Details")) {
                TextField("Food Name", text: $viewModel.foodName)
                    .font(Font.custom("Inter", size: 19))
                    .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                
                Divider()
                    .background(Color.white)
                
                TextField("Notes", text: $viewModel.notesVar)
                    .font(Font.custom("Inter", size: 19))
                    .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
            }
            
            Section(header: Text("Expiration")) {
                HStack {
                    Text("Added Date")
                        .font(Font.custom("Inter", size: 19))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    
                    DatePicker("", selection: $viewModel.creationDate, displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(DefaultDatePickerStyle())
                }
                
                Divider()
                    .background(Color.white)
                
                HStack {
                    Text("Expiration Date")
                        .font(Font.custom("Inter", size: 19))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    
                    DatePicker("", selection: $viewModel.expirationDate, displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(DefaultDatePickerStyle())
                }
                
                HStack {
                    Text("Remind me when ")
                        .font(Font.custom("Inter", size: 19))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    
                    Toggle(isOn: $viewModel.remindMe) {
                        Image(systemName: viewModel.remindMe ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(viewModel.remindMe ? .green : .gray)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.green))
                }
            }
            
            Button(action: {
                viewModel.addFood()
                showAddFoodView = false
            }) {
                Text("Save")
                    .font(Font.custom("Radio Canada", size: 24))
                    .foregroundColor(Color(red: 0.98, green: 0.93, blue: 0.66))
                    .frame(width: 112.73684, height: 40, alignment: .center)
                    .background(Color(red: 0.43, green: 0.51, blue: 0.42))
                    .cornerRadius(30)
                    .padding(.top, 40)
            }
        }
        .padding(30)
        .frame(width: 393, height: 852)
        .background(Color(red: 1, green: 0.96, blue: 0.89))
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView(showAddFoodView: .constant(true))
    }
}
