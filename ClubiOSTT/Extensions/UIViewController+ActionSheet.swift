//
//  UIViewController+NativeAlert.swift
//  ClubiOSTT
//
//  Created by Kévin Empociello on 4/29/24.
//

import UIKit

/** Extension to manage action sheet display */
extension UIViewController {

    /**
     Creates and displays an action sheet with as many action as wanted.
     - parameter actionSheetUI: Contains the needed data to create the actionSheet.
     */
    func displayActionSheet(from actionSheetUI: ActionSheetUI) {
        let alertController = UIAlertController(title: actionSheetUI.title?.localized,
                                                message: actionSheetUI.message?.localized,
                                                preferredStyle: .actionSheet)

        let cancelAction = UIAlertAction(title: "common.cancel".localized, style: .cancel) { _ in
            actionSheetUI.dismissCompletion?()
        }
        
        alertController.view.tintColor = UIColor.white
        alertController.addAction(cancelAction)

        actionSheetUI.actions.forEach { action in
            let alertAction = UIAlertAction(title: action.title.localized, style: action.style) { _ in
                action.action()
            }

            /** Add image to the right of AlertAction with margin of 8  */
            if let imageName = action.imageName, let image = UIImage(named: imageName) {
                let alertControllerWidth = alertController.view.frame.width
                let textSize = (action.title.localized as NSString).size(withAttributes: [.font: UIFont.systemFont(ofSize: 20)])
                
                /** Image has automatically a leading to 12 when using `setValue(forKey:)` */
                let defaultPaddingImage: CGFloat  = 12
                
                /** The default inset for UIAlertController is 8 */
                let margin: CGFloat = 8 * 2
                
                /** The wanted space between text and image */
                let space: CGFloat = 8
                
                /**
                 Calculate the image left padding following this formula:
                 (initialLeftPadding - (alertControllerWidth - margins) * 0.5 - textSizeWidth * 0.5 - space
                 Final insets should be negative when using `UIImage.withAlignmentRectInsets` method
                 */
                let imageLeftPadding = defaultPaddingImage - (alertControllerWidth - margin) * 0.5 - textSize.width * 0.5 - space
                let rightImage = image.withAlignmentRectInsets(UIEdgeInsets(top: -4, left: imageLeftPadding, bottom: 0, right: 0))

                alertAction.setValue(rightImage, forKey: "image")
            }

            alertController.addAction(alertAction)
        }

        present(alertController, animated: true)
    }

}
