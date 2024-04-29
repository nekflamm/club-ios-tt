//
//  UIApplication+Window.swift
//  ClubiOSTT
//
//  Created by Kévin Empociello on 4/13/24.
//

import UIKit

/** Extension of `UIApplication` to get a given key window */
extension UIApplication {
    
    /** Get the current key window. */
    var currentKeyWindow: UIWindow? {
        return UIApplication.shared.windows.filter({ $0.isKeyWindow }).first
    }

}
