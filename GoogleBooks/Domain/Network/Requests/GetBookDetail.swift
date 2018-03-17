//
//  GetBookDetail.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

struct GetBookDetail: APIRequest {
    
    typealias Response = Book
    
    var resourceName: String {
        return "\(Constants.url.volumeDetail)\(id)"
    }
    
    private let id: String

    init(id: String) {
        self.id = id
    }
}
