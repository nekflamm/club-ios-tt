//
//  DateConstants.swift
//  ClubiOSTT
//
//  Created by Kévin Empociello on 4/13/24.
//

import Foundation

/** Constants related to the date */
enum DateConstants {

    static let complete = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    static let zuluFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static let hour = "h:mm a"
    static let dayShort = "E"
    static let dayLong = "EEEE"
    static let dayOfMonth = "d MMM"
    static let shortDayMonthYear = "d MMM YYYY"
    static let longDayNumberMonth = "EEE, d MMM"
    static let longDayNumberMonthHour = "EEE, d MMM h:mma"
    static let monthOfYear = "MMM yyyy"
    static let monthOfShortYear = "MMM yy"
    static let usShortFormat = "MM-dd-YYYY"
    static let usShortSlashFormat = "MM/dd/YY"
    static let chatTimestamp = "h:mma"
}
