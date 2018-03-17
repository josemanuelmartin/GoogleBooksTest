//
//  DetailView.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

protocol DetailView: class {
    func updateBookDetail(model: DetailBookModel)
    func updateCover(_ imageData: Data)
}
