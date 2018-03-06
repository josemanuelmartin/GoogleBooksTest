//
//  UICollectionViewExtension.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    public func register<C: UICollectionViewCell>(_ type: C.Type) {
        
        register(C.nib, forCellWithReuseIdentifier: C.nibName)
    }
    
    public func dequeueReusableCell<C: UICollectionViewCell>(indexPath: IndexPath) -> C {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: C.nibName, for: indexPath) as? C else {
            fatalError("\(C.nibName) could not be dequeued for \(indexPath) as \(C.self)")
        }
        
        return cell
    }
}
