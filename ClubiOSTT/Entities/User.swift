//
//  User.swift
//  ClubiOSTT
//
//  Created by Kévin Empociello on 4/13/24.
//

import Foundation

/** Structure representing a user */
struct User: Codable, Hashable {
    
    // MARK: - Properties
    
    var id: String
    var createdAt: Date
    var username: String?
    var authEmail: String?
    var displayName: String?
    var biography: String?
    
    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case username
        case authEmail
        case displayName
        case biography
    }
    
    // MARK: - Initializers
    
    init(id: String,
         createdAt: Date,
         username: String?,
         authEmail: String?,
         displayName: String?,
         biography: String?) {
        self.id = id
        self.createdAt = createdAt
        self.username = username
        self.authEmail = authEmail
        self.displayName = displayName
        self.biography = biography
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        
        let dateString = try container.decode(String.self, forKey: .createdAt)
        self.createdAt = dateString.toDate() ?? Date()
        
        self.username = try? container.decode(String.self, forKey: .username)
        self.authEmail = try? container.decode(String.self, forKey: .authEmail)
        self.displayName = try? container.decode(String.self, forKey: .displayName)
        self.biography = try? container.decode(String.self, forKey: .biography)
    }

}

extension User {
    
    /**
     Get the formatted display name based on attribute available
     - returns: The formatted display name
     */
    func getDisplayName() -> String {
        return displayName ?? username ?? authEmail ?? ""
    }
}
