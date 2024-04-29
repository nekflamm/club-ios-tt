//
//  UIViewController+Popup.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 16/10/2020.
//

import UIKit

/** Extension to manage popup displays */
extension UIViewController {

    // MARK: - Functions

    /**
     Display a popup.
     - parameter popupViewModel: a `TLPopupViewModel` object to be mapped to a Popup UI.
     */
    func handleDisplayPopup(popupViewModel: TLPopupViewModel?) {
        guard let popupViewModel = popupViewModel else { return }

        alert(viewModel: popupViewModel)
    }

    /**
     Creates and displays a basic TL alert.
     - parameter title: The optionnal alert title.
     - parameter message: The alert message.
     - parameter close: The optionnal alert close.
     - parameter closeCompletion: Completion block used to handle when the close button is tapped
     */
    func displayBasicTLAlert(title: String? = nil,
                             message: String,
                             close: String? = nil,
                             closeCompletion: Completion? = nil) {

        let alertViewModel = TLPopupViewModel(icon: .alert,
                                              template: .dark,
                                              title: title ?? "common.error",
                                              message: message,
                                              close: close ?? "common.ok",
                                              action: nil,
                                              closeCompletion: closeCompletion)

        handleDisplayPopup(popupViewModel: alertViewModel)
    }

    // MARK: - Private functions

    /**
     Display a popup alert from the current view controller
     - parameter viewModel: A `TLPopupViewModel` which contains all properties to setup UI
     */
    private func alert(viewModel: TLPopupViewModel) {
        DispatchQueue.main.async {
            let alert = TLPopupViewController(viewModel: viewModel)
            
            alert.modalTransitionStyle = .crossDissolve
            alert.modalPresentationStyle = .overFullScreen
            
            self.present(alert, animated: true, completion: viewModel.presentedCompletion)
        }
    }
}
