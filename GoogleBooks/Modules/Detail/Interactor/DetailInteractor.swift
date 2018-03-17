//
//  DetailInteractor.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

protocol DetailInteractor {
    func getBookDetail(id: String, completion: @escaping(ResultCallback<Book>))
    func getCover(url: String, completion: @escaping(ResultCallback<Data>))
}
