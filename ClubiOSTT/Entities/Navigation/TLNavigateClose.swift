//
//  TLNavigateClose.swift
//  Club
//
//  Created by Kévin Empociello on 04/07/2022.
//

import Foundation

/** Object representing the action of closing a screen with parameters */
class TLNavigateClose {
    
    // MARK: - Properties
    
    /** Boolean indicating if the navigation should be animated or not */
    let animated: Bool
    
    /** Boolean indicating if you need to force dismiss the current flow
        for example if you need to dismiss a entire navigation flow */
    let forceDismiss: Bool
    
    /** Boolean indicating if you need to force the pop to the root vc,
     obviously it works only if you're in a navigation controller */
    let popToRoot: Bool
    
    /** The class of the controller we want to pop to */
    let popToController: AnyClass?
    
    /** Optionnal completion you want use when close is done */
    let completion: Completion?
    
    // MARK: - Initialisation
    
    init(animated: Bool = true,
         forceDismiss: Bool = false,
         popToRoot: Bool = false,
         popToController: AnyClass? = nil,
         completion: Completion? = nil) {
        self.animated = animated
        self.forceDismiss = forceDismiss
        self.popToRoot = popToRoot
        self.popToController = popToController
        self.completion = completion
    }
}

/** Alias for default completion without argument */
typealias Completion = (() -> Void)
