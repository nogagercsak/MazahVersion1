//
//  AddFoodView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 2/17/24.
//
import SwiftUI
import FirebaseAuth
import UserNotifications
struct AddFoodView: View {
    
    @StateObject private var viewModel = AddFoodViewModel()
    @Binding var showAddFoodView: Bool
    @Binding var showSignInView: Bool
    @State private var reminderDate: Date = Date()
    @State private var isReminderSet: Bool = false
    @State private var navigateToTrackerHome: Bool = false
    @State private var foodType: String = "Dairy"
    
    let foodTypes = ["Dairy", "Produce", "Meat", "Grains", "Beverages"]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Food!")
                    .font(Font.custom("Radio Canada", size: 45))
                    .padding(.top, 100)
                
                ScrollView {
                    VStack {
                        Section(header: Text("Food Details")) {
                            TextField("Food Name", text: $viewModel.foodName)
                            TextField("Notes", text: $viewModel.notesVar)
                        }
                        
                        Section(header: Text("Expiration")) {
                            DatePicker("Added Date", selection: $viewModel.creationDate, displayedComponents: .date)
                            DatePicker("Expiration Date", selection: $viewModel.expirationDate, displayedComponents: .date)
                            
                            Picker("Category", selection: $viewModel.foodType) {
                                ForEach(foodTypes, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            
                            Toggle("Remind me", isOn: $isReminderSet)
                            
                            if isReminderSet {
                                DatePicker("Remind me on", selection: $reminderDate, displayedComponents: .date)
                            }
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
                    viewModel.addFood(forUser: userId, category: foodType)  // Pass selected category
                    showAddFoodView = false
                    if isReminderSet {
                        scheduleReminder()
                    }
                    navigateToTrackerHome = true // Set to true to navigate to TrackerHomeView
                }) {
                    Text("Save")
                        .font(Font.custom("Radio Canada", size: 24))
                        .foregroundColor(Color(red: 0.98, green: 0.93, blue: 0.66))
                        .frame(width: 112.73684, height: 40, alignment: .center)
                        .background(Color(red: 0.43, green: 0.51, blue: 0.42))
                        .cornerRadius(30)
                        .padding(.bottom, 90)
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .fullScreenCover(isPresented: $navigateToTrackerHome) {
                    TrackerHomeView(showSignInView: $showSignInView)
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
    
    // Function to schedule reminder
    func scheduleReminder() {
        let content = UNMutableNotificationContent()
        content.title = "Food Expiration Reminder"
        content.body = "Don't forget to check the expiration of your food!"
        content.sound = UNNotificationSound.default
        
        // Set the reminder date
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: reminderDate)
        
        var dateComponents = DateComponents()
        dateComponents.year = components.year
        dateComponents.month = components.month
        dateComponents.day = components.day
        
        // Create the trigger based on the chosen date
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Create a unique identifier for the reminder
        let identifier = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        // Add the reminder to the notification center
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error scheduling reminder: \(error.localizedDescription)")
            } else {
                print("Reminder scheduled successfully!")
            }
        }
    }
}
struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView(showAddFoodView: .constant(true), showSignInView: .constant(true))
    }
}
