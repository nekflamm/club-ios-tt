//
//  AnalyticsUserProperty.swift
//  Club
//
//  Created by Adrien Carvalot on 06/01/2022.
//

import Foundation

/** Enumeration of all user properties of `AnalyticsProviderLogic` */
enum AnalyticsUserProperty: String, Hashable {
    case userId = "user_identifier"
    case adset = "ua_adset"
    case adsetId = "ua_adset_id"
    case afStatus = "ua_af_status"
    case campaign = "ua_campaign"
    case campaignId = "ua_campaign_id"
    case mediaSource = "ua_media_source"
    case afChannel = "ua_af_channel"
    case pushPermission = "push_permission"
}
