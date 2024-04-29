//
//  Navigate.swift
//  Club
//
//  Created by Kévin Empociello on 04/07/2022.
//

import Foundation
import UIKit

/** Class representing a navigate action with the needed properties */
class TLNavigate {
    
    // MARK: - Properties
    
    /** Specific storyboard in `TLStoryboard` */
    let storyboard: TLStoryboard
    
    /** The mode of navigation (push, present) */
    let mode: NavigationDisplayMode
    
    /** The presentation style to use for your navigation */
    let presentation: UIModalPresentationStyle

    /** The transition style to use for your navigation */
    let transitionStyle: UIModalTransitionStyle
    
    /** Boolean to choose if your screen should be presented
        as the root vc of a new navigation */
    let asNavRoot: Bool
    
    /** Boolean indicating if the navigation should be animated or not */
    let animated: Bool
    
    /** Arguments you want to give to your next screen,
        you should create your own [...]Arguments struct object */
    let args: Any?

    /** Boolean indicating if the `.presented` view controller can be dismissed by
     a swipe gesture. Only works with `.presented` */
    let canBeDismissedByGesture: Bool

    /** Completion block called after the presentation finishes.
     ⚠️ This block is not called when the mode is `panModel` or `pushed` */
    var completion: Completion?

    // MARK: - Initialisation
    
    init(_ storyboard: TLStoryboard,
         mode: NavigationDisplayMode = .pushed,
         presentation: UIModalPresentationStyle = .overFullScreen,
         transitionStyle: UIModalTransitionStyle = .coverVertical,
         asNavRoot: Bool = false,
         animated: Bool = true,
         args: Any? = nil,
         canBeDismissedByGesture: Bool = true,
         completion: Completion? = nil) {
        
        self.storyboard = storyboard
        self.mode = mode
        self.presentation = presentation
        self.transitionStyle = transitionStyle
        self.asNavRoot = asNavRoot
        self.animated = animated
        self.args = args
        self.canBeDismissedByGesture = canBeDismissedByGesture
        self.completion = completion
    }
}
