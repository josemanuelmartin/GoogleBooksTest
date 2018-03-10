//
//  DefaultSearchInteractor.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

class DefaultSearchInteractor: SearchInteractor {
    
    func getBooks(name: String, completion: @escaping(ResultCallback<[Book]>)) {
        
        let request = GetBooks(term: name)
        
        APIClient().send(request) { response in
            
            switch response {
            case .success(let search):
                let books = search.items
                completion(.success(books))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
}

