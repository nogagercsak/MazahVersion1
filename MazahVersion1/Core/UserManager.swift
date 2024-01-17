//
//  UserManager.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 1/1/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DBUser: Codable {
    let userId: String
    let email: String?
    let dateCreated: Date?
    
    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.email = auth.email
        self.dateCreated = Date()
    }
    init(
        userId: String,
        email: String?=nil,
        dateCreated: Date? = nil
    ) {
        self.userId = userId
        self.email = email
        self.dateCreated = dateCreated
    }
    enum CodingKeys: CodingKey {
        case email
        case userId
        case dateCreated
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.dateCreated = try container.decodeIfPresent(Date.self, forKey: .dateCreated)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
    }
}

final class UserManager{
    
    static let shared = UserManager()
    private init() { }
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId:String) -> DocumentReference {
        userCollection.document(userId)
    }
    
 /*   private let encoder:Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
    
    private let decoder:Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        Decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    } */
    
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
    
    
/*    func getUser(userId: String) async throws -> DBUser {
        let snapshot = try await userDocument(userId: userId).getDocument()
        
        guard let data = snapshot.data(), let userId = data["user_id"] as? String else{
            throw URLError(.badServerResponse)
        }
        
        let email = data["email"] as? String
        let photoUrl = data["photo_url"] as? String
        let dateCreated = data["data_created"] as? Date
        
        return DBUser(userId: userId, email: email, photoUrl: photoUrl, dateCreated: dateCreated)
    } */
    
    
    }

