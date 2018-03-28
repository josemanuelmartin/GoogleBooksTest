//
//  VolumeInfo.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

struct VolumeInfo: Decodable {
    
    let title: String?
    let authors: [String]?
    let publisher: String?
    let publishedDate: String?
    let description: String?
    let pageCount: Int?
    let categories: [String]?
    let imageLinks: ImageLink?
    let language: String?
    let previewLink: String?
    let infoLink: String?
    
    init(title: String? = nil,
         authors: [String]? = nil,
         publisher: String? = nil,
         publishedDate: String? = nil,
         description: String? = nil,
         pageCount: Int? = nil,
         categories: [String]? = nil,
         imageLinks: ImageLink? = nil,
         language: String? = nil,
         previewLink: String? = nil,
         infoLink: String?) {
        
        self.title = title
        self.authors = authors
        self.publisher = publisher
        self.publishedDate = publishedDate
        self.description = description
        self.pageCount = pageCount
        self.categories = categories
        self.imageLinks = imageLinks
        self.language = language
        self.previewLink = previewLink
        self.infoLink = infoLink
    }
}
