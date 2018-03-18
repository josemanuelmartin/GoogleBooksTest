//
//  SearchPresenter.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

protocol SearchPresenter: Presenter {
    func search(name: String)
    func loadDetail(bookIndex: Int)
    func getFilters() -> [BookFilterType]
    func getBooks(position: Int) -> [SearchBookModel]
}
