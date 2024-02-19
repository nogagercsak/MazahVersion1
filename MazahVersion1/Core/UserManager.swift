//
//  UserManager.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 1/1/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Vegetable: Codable {
    let id: String
    let title: String
    let recentlyBought: Bool
}

struct DBUser: Codable {
    let userId: String
    let email: String?
    let dateCreated: Date?
    let food: [String]?
    let favVegetable: Vegetable?

    
    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.email = auth.email
        self.dateCreated = Date()
        self.food = nil
        self.favVegetable = nil
    }
    
    init(
        userId: String,
        email: String? = nil,
        dateCreated: Date? = nil,
        food: [String]? = nil,
        favVegetable: Vegetable? = nil
    ) {
        self.userId = userId
        self.email = email
        self.dateCreated = dateCreated
        self.food = food
        self.favVegetable = favVegetable
    }
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case userId = "user_id"
        case dateCreated = "date_created"
        case food = "food"
        case favVegetable = "fav_vegetable"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.dateCreated = try container.decodeIfPresent(Date.self, forKey: .dateCreated)
        self.food = try container.decodeIfPresent([String].self, forKey: .food)
        self.favVegetable = try container.decodeIfPresent(Vegetable.self, forKey: .favVegetable)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.food, forKey: .food)
        try container.encodeIfPresent(self.favVegetable, forKey: .favVegetable)
    }
}

final class UserManager{
    
    static let shared = UserManager()
    private init() { }
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId:String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        //encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        //Decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func createNewUser(user:DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    //func createNewUser(auth: AuthDataResultModel) async throws{
    //var userData: [String:Any] = [
        //"user_id" : auth.uid,
  //          "date_created" : Timestamp(),
   //     ]
    //    if let email = auth.email{
     //       userData["email"] = email
      //  }
//        if let photoUrl = auth.photoUrl{
 //           userData["photo_url"] = photoUrl
  //      }
   //     try await userDocument(userId: auth.uid).setData(userData, merge: false)
  //  }
    
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self)

    }
    
    func addUserFood(userId: String, food: String) async throws{
        let data: [String:Any] = [
            DBUser.CodingKeys.food.rawValue : FieldValue.arrayUnion([food])
        ]
        try await userDocument(userId: userId).updateData(data) 
    }
    
    func removeUserFood(userId: String, food: String) async throws{
        let data: [String:Any] = [
            DBUser.CodingKeys.food.rawValue : FieldValue.arrayRemove([food])
        ]
        try await userDocument(userId: userId).updateData(data)
    }
    
    func addFavVegetable(userId: String, vegetable: Vegetable) async throws {
        let vegetableData: [String: Any] = [
            "id": vegetable.id,
            "title": vegetable.title,
            "recentlyBought": vegetable.recentlyBought
        ]
        let dict: [String: Any] = [
            DBUser.CodingKeys.favVegetable.rawValue: vegetableData
        ]
        try await userDocument(userId: userId).updateData(dict)
    }
    
    func removeFavVegetable(userId: String) async throws{
        let data: [String:Any?] = [
            DBUser.CodingKeys.favVegetable.rawValue : nil
        ]
        try await userDocument(userId: userId).updateData(data as [AnyHashable : Any])
    }
}

