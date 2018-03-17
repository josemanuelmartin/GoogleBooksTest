//
//  DefaultDetailPresenter.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

class DefaultDetailPresenter: DetailPresenter {
    
    private weak var view: DetailView?
    private let wireframe: DetailWireframe
    private let interactor: DetailInteractor
    private let bookIdentifier: String
    
    var detailBook: DetailBookModel?
    
    init(view: DetailView, wireframe: DetailWireframe, interactor: DetailInteractor, bookIdentifier: String) {
        self.view = view
        self.wireframe = wireframe
        self.interactor = interactor
        self.bookIdentifier = bookIdentifier
    }
    
    func viewDidLoad() {
        getBookDetail()
    }
    
    private func getBookDetail() {
        interactor.getBookDetail(id: bookIdentifier) { result in
            
            switch result {
            case .success(let book):
                self.view?.updateBookDetail(model: self.buildBook(book: book)!)
            case .failure:
                //TODO: Show error
                return
            }
        }
    }
    
    private func buildBook(book: Book) -> DetailBookModel? {
        
        if let volume = book.volumeInfo,
            let author = volume.authors,
            let date = volume.publishedDate,
            let title = volume.title,
            let thumbnail = volume.imageLinks?.thumbnail,
            let description = volume.description {
            
            let model = DetailBookModel()
            model.author = author[0]
            model.title = title
            model.thumbnail = thumbnail
            model.description = description
            model.publicationDate = date
            
            self.getCover(thumbnail: model.thumbnail!)
            
            return model
        }
        
        return nil
    }
    
    private func getCover(thumbnail: String) {
        interactor.getCover(url: thumbnail) { result in
            switch result {
            case .success(let cover):
                self.view?.updateCover(cover)
            case .failure:
                //TODO: show error
                break
            }
        }
    }
}
