//
//  SearchView.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

protocol SearchView: class {
    func refreshTable()
    func backgroundEmpty(_ state: Bool)
}
