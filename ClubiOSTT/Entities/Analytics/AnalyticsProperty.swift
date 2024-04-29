//
//  AnalyticsProperty.swift
//  Club
//
//  Created by Maxime Silla Pellicer on 09/02/2023.
//

import Foundation

/** Property used for `NewAnalyticsEvent` */
enum AnalyticsProperty {

    enum Dictionary: String {
        case amounts
        case indexes
        case lengths
        case times
        case values
    }
    
    enum Text: String {
        case id
        case creatorId = "creator_id"
        case source
        case variant
        case type
        case value
        case name
        case error
        case username
        case audioCodec = "audio_codec"
        case videoCodec = "video_codec"
        case tab
    }
    
    enum Number: String {
        case price
        case withdraw
        case fees
        case revenue
        case balance
        case count
        case index
        case length
        case size
        case minimum
        case maximum
        case duration
        case total
    }
    
    enum Boolean: String {
        case checked
        case filled
        case required
        case selected
        case hasAccess
        case isRead = "is_read"
        case isVerified = "is_verified"
        case isActive = "is_active"
        case isEnabled = "is_enabled"
        case hasEmail = "has_email"
        case hasPicture = "has_picture"
        case hasUsername = "has_username"
        case hasName = "has_name"
        case hasBadge = "has_badge"
        case isVault = "is_vaulted"
        case isCartouched = "is_cartouched"
        case isLogged = "is_logged"
        case isFromMe = "is_from_me"
    }
    
    enum Array: String {
        case changes
        case badges
        case ids
        case values
    }
}
