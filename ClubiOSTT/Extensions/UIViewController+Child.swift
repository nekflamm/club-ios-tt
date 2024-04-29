//
//  UIViewController+Child.swift
//  Boilerplate
//
//  Created by Adrien Carvalot on 22/10/2020.
//

import UIKit

/** Extension used to manage child in view controllers. */
extension UIViewController {
    
    /**
     Add a `UIViewController` as child in a given view.
     - parameter child: The child `UIViewController` to add.
     - parameter container: The container view where to add the child.
     */
    func addChild(_ child: UIViewController, container: UIView) {
        addChild(child)
        
        child.view.fitInView(container)
        child.didMove(toParent: self)
    }
    
    /** Remove self from childs. */
    func removeChild() {
        guard parent != nil else { return }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }

    /**
     Switch from a given VC to another given VC on a given container.
     - parameter fromVC: The current displayed VC
     - parameter toVC: The VC to switch with
     - parameter container: The container containing the children
     */
    func transition(fromVC: UIViewController?, toVC: UIViewController, container: UIView) {
        addChild(toVC, container: container)

        if let from = fromVC, from.parent == toVC.parent {
            from.removeChild()
        }
    }
}
