//
//  DefaultSearchPresenter.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

public enum BookFilterType {
    case initial, title, author, published
    
    var filterName: String {
        switch self {
        case .initial:
            return "Default"
        case .title:
            return "Title"
        case .author:
            return "Author"
        case .published:
            return "Date"
        }
    }
}

class DefaultSearchPresenter: SearchPresenter {
    
    private weak var view: SearchView?
    private let wireframe: SearchWireframe
    private let interactor: SearchInteractor
    
    private var books = [SearchBookModel]()
    lazy var filters: [BookFilterType] = [.initial, .title, .author, .published]
    
    
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
    
    func loadDetail(bookIndex: Int) {
        wireframe.loadDetail(book: books[bookIndex])
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
                let thumbnail = volume.imageLinks?.thumbnail,
                let date = volume.publishedDate {
                
                let model = SearchBookModel()
                model.author = author.first
                model.title = title
                model.thumbnail = thumbnail
                model.date = date
                model.identifier = book.id
                
                self.books.append(model)
            }
        }
    }
    
    func getBooks(position: Int) -> [SearchBookModel] {
        
        let filterType = filters[position]
        
        switch filterType {
        case .initial:
            return books
        case .title:
            return books.sorted(by: { $0.title! < $1.title! })
        case .author:
            return books.sorted(by: { $0.author! < $1.author! })
        case .published:
            return books.sorted(by: { $0.date! < $1.date! })
        }
    }

    func getFilters() -> [BookFilterType] {
        return filters
    }
}
