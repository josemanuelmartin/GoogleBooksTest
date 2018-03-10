//
//  Book.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

struct Book: Decodable {
   
    var kind: String?
    var id: String
    var etag: String?
    var selfLink: String?
    var volumeInfo: VolumeInfo?

    init(id: String,
         kind: String? = nil,
         etag: String? = nil,
         selfLink: String? = nil,
         volumeInfo: VolumeInfo? = nil) {

        self.id = id
        self.kind = kind
        self.etag = etag
        self.selfLink = selfLink
        self.volumeInfo = volumeInfo
    }
}
