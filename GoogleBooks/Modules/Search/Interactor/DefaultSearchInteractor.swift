//
//  DefaultSearchInteractor.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

class DefaultSearchInteractor: SearchInteractor {
    
    func getBooks(name: String) {
        APIClient().searchBook(book: name)
    }
}
