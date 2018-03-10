//
//  VolumeInfo.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

struct VolumeInfo: Decodable {
    
    var title: String?
    var authors: [String]?
    var publisher: String?
    var publishedDate: String?
    var description: String?
    var pageCount: Int?
    var categories: [String]?
    var imageLink: ImageLink?
    var language: String?
    var previewLink: String?
    
    init(title: String? = nil,
         authors: [String]? = nil,
         publisher: String? = nil,
         publishedDate: String? = nil,
         description: String? = nil,
         pageCount: Int? = nil,
         categories: [String]? = nil,
         imageLink: ImageLink? = nil,
         language: String? = nil,
         previewLink: String? = nil) {
        
        self.title = title
        self.authors = authors
        self.publisher = publisher
        self.publishedDate = publishedDate
        self.description = description
        self.pageCount = pageCount
        self.categories = categories
        self.imageLink = imageLink
        self.language = language
        self.previewLink = previewLink
    }
}
