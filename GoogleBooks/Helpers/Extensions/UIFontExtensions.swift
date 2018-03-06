//
//  UIFontExtension.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func latoLight(size: CGFloat) -> UIFont {
       
        guard let font = UIFont(name: "Lato-Light", size: size) else {
            fatalError("Cannot load Lato-Light font")
        }
        
        return font
    }
    
    static func latoRegular(size: CGFloat) -> UIFont {
       
        guard let font = UIFont(name: "Lato-Regular", size: size) else {
            fatalError("Cannot load Lato-Regular font")
        }
        
        return font
    }
    
    static func latoBold(size: CGFloat) -> UIFont {
        
        guard let font = UIFont(name: "Lato-Bold", size: size) else {
            fatalError("Cannot load Lato-Bold font")
        }
        
        return font
    }
    
}
