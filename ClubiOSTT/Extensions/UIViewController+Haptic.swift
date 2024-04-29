//
//  UIViewController+Haptic.swift
//  ClubiOSTT
//
//  Created by Kévin Empociello on 4/24/24.
//

import UIKit

/** Extension to send an haptic feedback to the user. */
extension UIViewController {
    
    /**
     Send a given haptic feedback to the user.
     - parameter hapticFeedback: The haptic feedback to send.
     */
    func vibrate(_ hapticFeedback: HapticFeedback) {
        HapticFeedbackManager.shared.vibrate(hapticFeedback)
    }
    
}
