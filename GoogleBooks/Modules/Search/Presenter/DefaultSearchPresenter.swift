//
//  DefaultSearchPresenter.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

class DefaultSearchPresenter: SearchPresenter {
    
    var wireframe: SearchWireframe!
    var interactor: SearchInteractor!
    
    var books = [SearchBookModel]()
    
    func viewDidLoad() {
        //TODO: Remove
        fakeData()
    }
    
    func search(name: String) {
        
    }
    
    func loadDetail(bookIndex: Int) {
        wireframe.loadDetail(book: books[bookIndex])
    }
   
    private func fakeData() {
        //interactor.getBooks(name: "Anillos")
        let book = SearchBookModel()
        book.author = "Author"
        book.title = "Title"
        self.books = [book, book, book, book, book, book, book, book]
    }
    
}
