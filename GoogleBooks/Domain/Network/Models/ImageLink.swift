//
//  ImageLink.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

struct ImageLink: Decodable {
    
    var smallThumbnail: String?
    var thumbnail: String?
    
    init(smallThumbnail: String? = nil,
         thumbnail: String? = nil) {
        
        self.smallThumbnail = smallThumbnail
        self.thumbnail = thumbnail
    }
}
