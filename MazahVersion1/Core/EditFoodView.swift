//
//  EditFoodView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 2/17/24.
//
import SwiftUI
struct EditFoodView: View {
    
    @State private var foodName: String = ""
    @State private var creationDate = Date()
    @State private var expirationDate = Date()
    @State private var foodType: String = ""
    @State private var notesVar: String = ""
    @State private var remindMe = false
    
    var body: some View {
        VStack {
            Text("< Go back to Foods")
                .font(Font.custom("Inter", size: 19))
                .foregroundColor(Color(red: 0.45, green: 0.68, blue: 0))
                .frame(width: 224, height: 31, alignment: .topLeading)
                .padding(.top, -170)
            
            Text("Edit Food")
                .font(Font.custom("Radio Canada", size: 45))
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                .padding(.top, -100)
            
            Section(header: Text("Food Details")) {
                TextField("Food Name", text: $foodName)
                    .font(Font.custom("Inter", size: 19))
                    .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                
                Divider()
                    .background(Color.white)
                
                TextField("Notes", text: $notesVar)
                    .font(Font.custom("Inter", size: 19))
                    .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
            }
            
            Section(header: Text("Expiration")) {
                HStack {
                    Text("Added Date")
                        .font(Font.custom("Inter", size: 19))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    
                    DatePicker("", selection: $creationDate, displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(DefaultDatePickerStyle())
                }
                
                Divider()
                    .background(Color.white)
                
                HStack {
                    Text("Expiration Date")
                        .font(Font.custom("Inter", size: 19))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    
                    DatePicker("", selection: $expirationDate, displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(DefaultDatePickerStyle())
                }
                
                HStack {
                    Text("Remind me when ")
                        .font(Font.custom("Inter", size: 19))
                        .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    
                    Toggle(isOn: $remindMe) {
                        Image(systemName: remindMe ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(remindMe ? .green : .gray)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.green))
                }
            }
            
            Button(action: {
                // Save action
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
struct EditFoodView_Previews: PreviewProvider {
    static var previews: some View {
        EditFoodView()
    }
}
