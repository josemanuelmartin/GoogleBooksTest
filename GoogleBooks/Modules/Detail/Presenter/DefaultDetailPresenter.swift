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
            case .success(let result):
                guard let book = self.buildBook(book: result)  else { return }
                
                self.view?.updateBookDetail(model: book)
                
            case .failure:
                //TODO: Show error
                return
            }
        }
    }
    
    private func buildBook(book: Book) -> DetailBookModel? {
        
        if let volume = book.volumeInfo {
            
            let model = DetailBookModel()
            model.author = volume.authors?[0]
            model.title = volume.title
            model.thumbnail = volume.imageLinks?.thumbnail
            model.description = volume.description
            model.publicationDate = volume.publishedDate
            
            if let thumbnail = model.thumbnail {
                self.getCover(thumbnail: thumbnail)
            }
            
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
