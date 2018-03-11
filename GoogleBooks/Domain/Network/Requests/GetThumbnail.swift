//
//  GetThumbnail.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

struct GetThumbnail: APIRequest {
    
    typealias Response = Data
    
    var resourceName: String {
        return urlImage
    }
    
    private let urlImage: String
    
    init(urlImage: String) {
        self.urlImage = urlImage
    }
}
