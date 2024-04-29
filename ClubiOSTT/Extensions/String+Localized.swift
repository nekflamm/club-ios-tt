//
//  String+Localized.swift
//  Boilerplate
//
//  Created by Kevin Naudin on 02/06/2021.
//

import UIKit

/** Extension to make localizable shorter */
extension String {

    /** Get the localized value of this string */
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

}
