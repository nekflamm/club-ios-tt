//
//  HapticFeedbackManager.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 02/06/2021.
//

import UIKit

/** Manager used to send an haptic feedback to the user. */
class HapticFeedbackManager {

    // MARK: - Properties

    /** Common instance of self. */
    static let shared = HapticFeedbackManager()

    // MARK: - Functions

    /**
     Send a given haptic feedback to the user.
     - parameter hapticFeedback: The haptic feedback to send.
     */
    func vibrate(_ hapticFeedback: HapticFeedback) {
        if let style = hapticFeedback.impactStyle {
            let feedbackGenerator = UIImpactFeedbackGenerator(style: style)
            feedbackGenerator.prepare()
            feedbackGenerator.impactOccurred()
        } else if let notificationStyle = hapticFeedback.notificationStyle {
             UINotificationFeedbackGenerator().notificationOccurred(notificationStyle)
        } else if hapticFeedback == .selectionChanged {
            UISelectionFeedbackGenerator().selectionChanged()
        }
    }
}
