//
//  DefaultSearchPresenter.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

class DefaultSearchPresenter: SearchPresenter {
    
    weak var view: SearchView?
    let wireframe: SearchWireframe
    let interactor: SearchInteractor
    
    var books = [SearchBookModel]()
    
    init(view: SearchView, wireframe: SearchWireframe, interactor: SearchInteractor ) {
        self.view = view
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func viewDidLoad() {
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
            if let volume = book.volumeInfo, let author = volume.authors, let title = volume.title {
                let model = SearchBookModel()
                model.author = author[0]
                model.title = title
                
                self.books.append(model)
            }
        }
    }
    
    func loadDetail(bookIndex: Int) {
        wireframe.loadDetail(book: books[bookIndex])
    }
   
}
