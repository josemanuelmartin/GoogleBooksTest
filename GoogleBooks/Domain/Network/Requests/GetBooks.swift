//
//  GetBooks.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

struct GetBooks: APIRequest {
    
    typealias Response = [Book]
    
    var resourceName: String {
        return "volumes?q=\(term)"
    }
    
    private let term: String
    
    init(term: String) {
        self.term = term
    }
}
