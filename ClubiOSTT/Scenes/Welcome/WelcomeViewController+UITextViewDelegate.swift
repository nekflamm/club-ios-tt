//
//  WelcomeViewController+UITextViewDelegate.swift
//  Club
//
//  Created by Adrien Carvalot on 07/01/2022.
//

import SafariServices

/** Extension used to manage textview delegate to handle click on links or disable the highlight on textview */
extension WelcomeViewController {
    func textViewDidChangeSelection(_ textView: UITextView) {
        /** Mandatory to disable the hightlight of words in the textview */
        textView.selectedTextRange = nil
    }

}
