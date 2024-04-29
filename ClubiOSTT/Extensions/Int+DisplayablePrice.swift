//
//  Int+DisplayablePrice.swift
//  ClubiOSTT
//
//  Created by Kévin Empociello on 4/24/24.
//

import Foundation

extension Int {

    /**
     Returns the price converted as dollars.
     - returns: The price converted to dollars as `String`.
     */
    func getDisplayablePrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = "."
        formatter.locale = Locale(identifier: "en_US")

        let priceAsDouble = Double(self) / 100
        let nsNumberPrice = NSNumber(value: priceAsDouble)
        let formattedPrice = formatter.string(from: nsNumberPrice) ?? "$-"

        return formattedPrice
    }

}
