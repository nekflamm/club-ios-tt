//
//  TLPopupTemplate.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 05/12/2019.
//  Copyright © 2019 Kevin Empociello. All rights reserved.
//

import UIKit

/** Enum to manage different popup styles / designs */
enum TLPopupTemplate: String {
    
    // MARK: - Templates
    
    case white
    case dark

    // MARK: - Functions
    
    /**
     Get the background color
     - returns: the color
     */
    func getBackgroundColor() -> UIColor {
        switch self {
        case .white:
            return UIColor.custom.white
        case .dark:
            return UIColor.custom.gray07
        }
    }
    
    /**
     Get the primary color for the right template
     - returns: the color
     */
    func getIconTintColor() -> UIColor {
        switch self {
        case .white:
            return UIColor.custom.black
        case .dark:
            return UIColor.custom.white
        }
    }
    
    /**
     Get the title text color
     - returns: the color
     */
    func getTitleColor() -> UIColor {
        switch self {
        case .white:
            return UIColor.custom.black
        case .dark:
            return UIColor.custom.white
        }
    }
    
    /**
     Get the message text color
     - returns: the color
     */
    func getMessageColor() -> UIColor {
        switch self {
        case .white:
            return UIColor.custom.black
        case .dark:
            return UIColor.custom.gray03
        }
    }
    
    /**
     Get the title text font
     - returns: the font
     */
    func getTitleFont() -> UIFont {
        switch self {
        case .white:
            return UIFont.bold(size: 22.0)
        case .dark:
            return UIFont.semiBold(size: 17)
        }
    }
    
    /**
     Get the message text font
     - returns: the font
     */
    func getMessageFont() -> UIFont {
        switch self {
        case .white:
            return UIFont.regular(size: 16.0)
        case .dark:
            return UIFont.regular(size: 16)
        }
    }
    
    /**
     Get the close button template.
     - returns: The button template.
     */
    func getCloseButtonTemplate() -> TLButton.Template {
        switch self {
        case .white:
            return .darkGray
        case .dark:
            return .darkGray
        }
    }
    
    /**
     Get the action button template.
     - returns: The button template.
     */
    func getActionButtonTemplate() -> TLButton.Template {
        switch self {
        case .white:
            return .darkGray
        case .dark:
            return .white
        }
    }
    
}
