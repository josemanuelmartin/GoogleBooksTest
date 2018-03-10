//
//  BookResponse.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

struct BookResponse<Results: Decodable>: Decodable {
    
    let kind: String
    let totalItems: Int
    let items: Results
    
    public init(kind: String = "",
                totalItems: Int = 0,
                items: Results) {
        self.kind = kind
        self.totalItems = totalItems
        self.items = items
    }
}
