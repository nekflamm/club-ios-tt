//
//  BaseViewController+UITextFieldDelegate.swift
//  Club
//
//  Created by Florian Pygmalion on 14/02/2023.
//

import UIKit

// MARK: - Extension UITextFieldDelegate

extension BaseViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {

        /** Used to put the cursor at the end of the line */
        let newPosition = textField.endOfDocument
        textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
    }

    /** Refers to the `textField(_:shouldChangeCharactersIn:range:string:)` function of the `UITextFieldDelegate` */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let currentIndex = fields?.firstIndex(where: { ($0 as? UITextField) == textField }) else {
            return true
        }

        /** Prevents return button to be used */
        guard string != "\n" else {
            selectNextInputs(at: currentIndex)

            return false
        }

        return true
    }

}
