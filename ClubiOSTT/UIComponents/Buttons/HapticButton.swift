//
//  HapticButton.swift
//  Boilerplate
//
//  Created by Adrien Carvalot on 18/12/2020.
//

import UIKit

/** Button able to send an haptic feedback on tap. */
class HapticButton: UIButton {

    // MARK: - Properties
    
    /** The haptic feedback to launch when self is tapped */
    var hapticFeedback: HapticFeedback = .light

    // MARK: - Override properties

    override var buttonType: UIButton.ButtonType {
        return .custom
    }

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupButton()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupButton()
    }

    // MARK: - Private functions

    /** Common setup design */
    private func setupButton() {
        if #available(iOS 15.0, *) {
            configuration = nil
        }
    }
    
    // MARK: - Events
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        HapticFeedbackManager.shared.vibrate(hapticFeedback)
    }

}
