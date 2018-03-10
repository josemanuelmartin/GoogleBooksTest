//
//  BookError.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

enum BookError: Error {
    case encoding
    case decoding
    case server(message: String)
}
