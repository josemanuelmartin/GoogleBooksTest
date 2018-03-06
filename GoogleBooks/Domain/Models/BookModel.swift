//
//  BookModel.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

enum SerializationError: Error {
    case missing(String)
}

struct BookModel {
    var id: String
    var image: String
    var title: String
    var author: String
    var description: String
    
    init(id: String, image: String, title: String, author: String, description: String = "") {
        self.id = id
        self.image = image
        self.title = title
        self.author = author
        self.description = description
    }
    
    init(json: [String: Any]) throws {
        
        guard let id = json["id"] as? String else {
            throw SerializationError.missing("id")
        }
        guard let volumeInfo = json["volumeInfo"] as? [String: Any] else {
            throw SerializationError.missing("volumeInfo")
        }
        
        guard let volumeTitle = volumeInfo["title"] as? String else {
            throw SerializationError.missing("title")
        }
        
        let authors = volumeInfo["authors"] as? [String]
        
        let description = json["description"] as? String
        
        if let imageLinks = volumeInfo["imageLinks"] as? [String: Any],
            let image = imageLinks["thumbnail"] as? String {
            self.image = image
        } else {
            self.image = ""
        }
        
        self.id = id
        self.title = volumeTitle
        self.author = authors?.first! ?? ""
        self.description = description ?? ""
    }
    
}
