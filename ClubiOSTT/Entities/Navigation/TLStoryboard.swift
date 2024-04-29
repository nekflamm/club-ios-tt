//
//  TLStoryboard.swift
//  Club
//
//  Created by Kévin Naudin on 27/03/2023.
//

import UIKit

/** Enumeration of all Club screens */
enum TLStoryboard {

    case RequestsList
    case Welcome
}

// MARK: - Extension

extension TLStoryboard {
    
    /**
     Get an optional `UIViewController` instanciate from storyboard
     - returns: An optional `UIViewController`
     */
    func getViewController() -> UIViewController? {
        let storyboardName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        guard let controller: UIViewController = storyboard.instantiateInitialViewController() else {
            Log.record("Cannot instantiate UIViewController from \(self).storyboard")
            return nil
        }
        
        return controller

    }
    
    /**
     Get `AnyClass` of the `UIViewController` based on the namespace of the Storyboard
     - returns: An `AnyClass`
     */
    func getViewControllerClass() -> AnyClass? {
        // get namespace
        guard let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            return nil
        }

        // get 'anyClass' with classname and namespace
        let cls: AnyClass = NSClassFromString("\(namespace).\(self)ViewController")!

        // return AnyClass!
        return cls
    }
    
}
