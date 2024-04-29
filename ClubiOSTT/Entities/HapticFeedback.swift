//
//  HapticFeedback.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 02/06/2021.
//

import UIKit

/** Enum containing all the haptics feedbacks type. */
enum HapticFeedback {

    // MARK: - Cases

    case light
    case medium
    case heavy
    case error
    case warning
    case success
    case selectionChanged
    case none

    // MARK: - Properties

    /** Indicates the impact style. */
    var impactStyle: UIImpactFeedbackGenerator.FeedbackStyle? {
        switch self {
        case .light:
            return .light
        case .medium:
            return .medium
        case .heavy:
            return .heavy
        default:
            return nil
        }
    }

    /** Indicates the notification style. */
    var notificationStyle: UINotificationFeedbackGenerator.FeedbackType? {
        switch self {
        case .error:
            return .error
        case .warning:
            return .warning
        case .success:
            return .success
        default:
            return nil
        }
    }

}
