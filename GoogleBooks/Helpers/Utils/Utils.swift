//
//  Utils.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

infix operator ???

func ???<T>(_ firstOption:T?, _ secondOption:T) -> T {
    
    if let option = firstOption {
        return option
    } else {
        return secondOption
    }
    
}
