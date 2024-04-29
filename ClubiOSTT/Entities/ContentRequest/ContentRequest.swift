//
//  ContentRequest.swift
//  Club
//
//  Created by Kévin Empociello on 05/09/2022.
//

import Foundation

/** Structure representing a type of content available for the fans
    to be requested to their creator  */
struct ContentRequest: Codable, Hashable {
    
    let id: String
    let createdAt: Date
    let title: String
    let description: String?
    let price: Int
    
    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case createdAt
        case price
    }

    // MARK: - Initializers

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)

        let dateString = try container.decode(String.self, forKey: .createdAt)
        self.createdAt = dateString.toDate() ?? Date()

        self.title = try container.decode(String.self, forKey: .title)
        self.description = try? container.decode(String.self, forKey: .description)
        self.price = try container.decode(Int.self, forKey: .price)
    }
    
    /** Initializer used to mock data */
    init(id: String,
         createdAt: Date,
         title: String,
         description: String?,
         price: Int) {
        self.id = id
        self.createdAt = createdAt
        self.title = title
        self.description = description
        self.price = price
    }
    
}
