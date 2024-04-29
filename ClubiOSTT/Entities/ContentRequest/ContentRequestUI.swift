//
//  ContentRequestUI.swift
//  Club
//
//  Created by Adrien Carvalot on 07/09/2022.
//

import Foundation

/** Structure representing the UI model of a content available for the fans
    to be requested to their creator */
struct ContentRequestUI {
    let id: String
    let title: String
    let description: String?
    let price: String
}
