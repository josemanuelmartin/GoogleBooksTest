//
//  APIRequest.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

protocol APIRequest: Encodable {
    
    associatedtype Response: Decodable
    
    var resourceName: String { get }
}
