//
//  UICollectionViewCellExtension.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
   
    public static var nibName: String {
        
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public static var nib: UINib {
        
        return UINib(nibName: nibName, bundle: nil)
    }
}
