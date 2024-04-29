//
//  String+ToDate.swift
//  Club
//
//  Created by Florian Pygmalion on 27/01/2022.
//

import Foundation

/** Extension used to convert a `String` to a `Date`. */
extension String {

    /**
     Transform your String into Date with a given format
     - parameter format: The date format (https://nsdateformatter.com)
     - returns: The date object if the format was good, nil otherwise
     */
    func toDate(format: String = DateConstants.complete) -> Date? {
        let formatter = DateFormatter()

        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format
        if let date = formatter.date(from: self) {
            return date
        }

        Log.record("Cannot serialize string to date, locale : \(Locale.current), dateString: \(self), formatUsed: \(format)")
        return nil
    }

    /**
     Transform your String into Date with a given format
     - parameter format: The date format (https://nsdateformatter.com)
     - parameter defaultValue: The date value
     - returns: The date object if the format was good or the default value ortherwise
     */
    func toDateWithDefault(format: String = DateConstants.complete,
                           defaultValue: Date = Date()) -> Date {
        return self.toDate(format: format) ?? defaultValue
    }

}
