//
//  UIFont+Default.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 02/06/2021.
//

import UIKit

extension UIFont {
    
    /**
     Return the specific "SFPro-Text-Light" if found, otherwise default system font
     - parameter size: The font size as `CGFloat`
     - returns: The font as `UIFont`
     */
    static func light(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    /**
     Return the specific "SFPro-Text-Regular" if found, otherwise default system font
     - parameter size: The font size as `CGFloat`
     - returns: The font as `UIFont`
     */
    static func regular(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    /**
     Return the specific "SFPro-Text-Medium" if found, otherwise default system font
     - parameter size: The font size as `CGFloat`
     - returns: The font as `UIFont`
     */
    static func medium(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    /**
     Return the specific "SFPro-Text-Semibold" if found, otherwise default system font
     - parameter size: The font size as `CGFloat`
     - returns: The font as `UIFont`
     */
    static func semiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Semibold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    /**
     Return the specific "SFPro-Text-Bold" if found, otherwise default system font
     - parameter size: The font size as `CGFloat`
     - returns: The font as `UIFont`
     */
    static func bold(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    /**
     Return the specific "SFPro-Text-Heavy" if found, otherwise default system font
     - parameter size: The font size as `CGFloat`
     - returns: The font as `UIFont`
     */
    static func heavy(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Heavy", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    /**
     Return the specific "SFPro-Text-Black" if found, otherwise default system font
     - parameter size: The font size as `CGFloat`
     - returns: The font as `UIFont`
     */
    static func black(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Black", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    /**
     Return the specific "SFProDisplay-BlackItalic" if found, otherwise default system font
     - parameter size: The font size as `CGFloat`
     - returns: The font as `UIFont`
     */
    static func blackItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-BlackItalic", size: size) ?? UIFont.systemFont(ofSize: size)
    }

    /**
     Return the specific "SFProDisplay-MediumItalic" if found, otherwise default system font
     - parameter size: The font size as `CGFloat`
     - returns: The font as `UIFont`
     */
    static func mediumItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-MediumItalic", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
