//
//  FoodTrackerView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 2/17/24.
//
import SwiftUI
import FirebaseAuth
struct FoodTrackerView: View {
    
    var food: Food
    @State private var isDeleteAlertPresented = false
        
    
    var body: some View {
        ScrollView {
            VStack {
                
                Text(food.name)
                    .font(Font.custom("Inter", size: 48))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    .frame(width: 334, height: 94, alignment: .top)
                
                HStack(spacing: 20) {
                    InfoBox(title: "Added", detail: formattedDate(food.creationDate))
                    InfoBox(title: "Expires", detail: formattedDate(food.expDate))
                }
                .padding(.vertical, 10)
                
                InfoBox(title: "Notes", detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet eros ac nisl malesuada rutrum.")
                    .padding(.vertical, 10)
                
                InfoBox(title: "Picture of vegi food theme", detail: "")
                    .padding(.vertical, 10)
                
                Button(action: {
                    // Edit action
                }) {
                    Text("Edit")
                        .font(Font.custom("Radio Canada", size: 24))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.98, green: 0.93, blue: 0.66))
                        .frame(width: 112.73684, height: 40, alignment: .center)
                        .background(Color(red: 0.43, green: 0.51, blue: 0.42))
                        .cornerRadius(10)
                        .padding(.vertical, 20)
                }
                
                Button(action: {
                                    isDeleteAlertPresented = true
                                }) {
                                    Text("Delete")
                                        // Button styling...
                                }
                                .alert(isPresented: $isDeleteAlertPresented) {
                                    Alert(
                                        title: Text("Delete Food"),
                                        message: Text("Are you sure you want to delete this food?"),
                                        primaryButton: .destructive(Text("Delete")) {
                                            deleteFood()
                                        },
                                        secondaryButton: .cancel()
                                    )
                                }
                                
                                Spacer()
                                
                            }
                            .padding()
                            .navigationTitle("Food Details")
                        }
                    }
                    
                    private func deleteFood() {
                        guard let userId = Auth.auth().currentUser?.uid, let foodId = food.id else {
                            return
                        }
                        
                        FirestoreManager.shared.deleteFood(forUser: userId, foodId: foodId) { error in
                            if let error = error {
                                print("Error deleting food: \(error.localizedDescription)")
                            } else {
                                print("Food deleted successfully!")
                                // Handle navigation or other updates after deletion
                            }
                        }
                    }
                }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
struct FoodTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        FoodTrackerView(food: Food(id: "1", name: "Watermelon", creationDate: Date(), expDate: Date(), foodType: "Fruit", reminder: false, category: "Produce"))
    }
}
struct InfoBox: View {
    var title: String
    var detail: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(10)
            
            VStack {
                Text(title)
                    .font(Font.custom("Inter", size: 20))
                    .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    .padding(.top, 8)
                
                Text(detail)
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
    }
}
