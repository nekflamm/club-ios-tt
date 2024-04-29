//
//  BaseViewController+KeyboardBinding.swift
//  Club
//
//  Created by Kévin Empociello on 14/10/2020.
//

import UIKit

/** Keyboard binding to bottom components */
extension BaseViewController {

    /** Boolean value indicating if the keyboard is displayed or not to avoid glitch moving twice the components */
    var isKeyboardDisplayed: Bool {
        get {
            return _isKeyboardDisplayed
        }
        set(newValue) {
            _isKeyboardDisplayed = newValue
        }
    }

    /** The current height of the keyboard expressed as CGFloat */
    var currentKeyboardHeight: CGFloat {
        get {
            return _currentKeyboardHeight
        }
        set(newValue) {
            _currentKeyboardHeight = newValue
        }
    }

    /** The most bottom constraint to be set to the needed value in your VC to be moved with keyboard automatically */
    var bottomConstraint: NSLayoutConstraint? {
        get {
            return _bottomConstraint
        }
        set(newValue) {
            _bottomConstraint = newValue
        }
    }

    // MARK: - Functions

    /** Setup keyboard binding to have your bottom component moving with it */
    func setupKeyboardBinding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame),
                                              name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    /** Removing keyboard binding */
    func removeKeyboardBinding() {
        view.endEditing(true)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        bottomConstraint = nil
        isKeyboardDisplayed = false
        currentKeyboardHeight = 0.0
    }

    /** Keyboard will show function  */
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           UIApplication.shared.applicationState == .active {
            let offset = keyboardSize.height - view.safeAreaInsets.bottom

            if bottomConstraint?.constant == 16 {
                bottomConstraint?.constant += offset
                currentKeyboardHeight = keyboardSize.height
                isKeyboardDisplayed = true

                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }

    /** Keyboard will hide function  */
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           UIApplication.shared.applicationState == .active {
            let offset = keyboardSize.height - view.safeAreaInsets.bottom
            
            if bottomConstraint?.constant != 16 {
                bottomConstraint?.constant -= offset
                currentKeyboardHeight = 0.0
                isKeyboardDisplayed = false

                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }

    /** Keyboard will change frame function  */
    @objc func keyboardWillChangeFrame(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let newKeyboardHeight = keyboardFrame.cgRectValue.size.height

            if currentKeyboardHeight != 0 {
                let gap = newKeyboardHeight - currentKeyboardHeight

                bottomConstraint?.constant += gap
                currentKeyboardHeight = newKeyboardHeight

                UIView.animate(withDuration: 0.2) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
}
