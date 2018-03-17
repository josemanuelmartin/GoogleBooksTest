//
//  DefaultSearchPresenter.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

class DefaultSearchPresenter: SearchPresenter {
    
    private weak var view: SearchView?
    private let wireframe: SearchWireframe
    private let interactor: SearchInteractor
    
    var books = [SearchBookModel]()
    
    init(view: SearchView, wireframe: SearchWireframe, interactor: SearchInteractor ) {
        self.view = view
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func search(name: String) {
        
        interactor.getBooks(name: name) { result in
            
            switch result {
            case .success(let books):
                self.books.removeAll()
                self.buildBooks(books: books)
                self.refreshTable(isEmpty: false)
            case .failure:
                self.books.removeAll()
                self.refreshTable(isEmpty: true)
            }
        }
    }
    
    private func refreshTable(isEmpty: Bool) {
        DispatchQueue.main.async {
            self.view?.backgroundEmpty(isEmpty)
            self.view?.refreshTable()
        }
    }
    
    private func buildBooks(books: [Book]) {
        
        for book in books {
            if let volume = book.volumeInfo,
                let author = volume.authors,
                let title = volume.title,
                let thumbnail = volume.imageLinks?.thumbnail {
                
                let model = SearchBookModel()
                model.author = author[0]
                model.title = title
                model.thumbnail = thumbnail
                model.identifier = book.id
                
                self.books.append(model)
            }
        }
    }
    
    func loadDetail(bookIndex: Int) {
        wireframe.loadDetail(book: books[bookIndex])
    }
   
}
