//
//  BaseViewController+UITextViewDelegate.swift
//  Club
//
//  Created by Florian Pygmalion on 14/02/2023.
//

import UIKit

// MARK: - Extension UITextViewDelegate

extension BaseViewController: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        /** Used to put the cursor at the end of the line */
        let newPosition = textView.endOfDocument
        textView.selectedTextRange = textView.textRange(from: newPosition, to: newPosition)
    }

    /** Verify whether the new input is valid when user enters characters in the TextView */
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        guard let currentIndex = fields?.firstIndex(where: { ($0 as? UITextView) == textView }) else {
            return true
        }

        guard !(textView.returnKeyType == .done && text == "\n") else {
            selectNextInputs(at: currentIndex)

            return false
        }

        return true
    }

}
