//
//  UITableExtensions.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import UIKit

public extension UITableView {
    
    public func register<T: UITableViewCell> (_ type: T.Type) {

        register(T.nib, forCellReuseIdentifier: T.nibName)
    }
    
    public func dequeReusableCell<T: UITableViewCell>() -> T {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.nibName) as? T else {
            fatalError("\(T.nibName) cold not be dequeued as \(T.self)")
        }
        
        return cell
    }
    
}
