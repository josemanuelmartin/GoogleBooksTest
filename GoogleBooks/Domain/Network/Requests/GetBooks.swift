//
//  GetBooks.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

struct GetBooks: APIRequest {
    
    typealias Response = BookResponse<[Book]>
    
    var resourceName: String {
        return "\(Constants.url.volumes)\(term)"
    }
    
    private let term: String
    
    init(term: String) {
        self.term = term
    }
}
