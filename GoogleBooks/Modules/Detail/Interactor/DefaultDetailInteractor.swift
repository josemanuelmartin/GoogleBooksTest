//
//  DefaultDetailInteractor.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

class DefaultDetailInteractor: DetailInteractor {
    
    let apiClient = APIClient()
    
    func getBookDetail(id: String, completion: @escaping(ResultCallback<Book>)) {
        
        let request = GetBookDetail(id: id)
        
        apiClient.send(request) { response in
            switch response {
            case .success(let book):
                completion(.success(book))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getCover(url: String, completion: @escaping(ResultCallback<Data>)) {
        
        let request = GetThumbnail(urlImage: url)
        
        APIClient().getThumbnail(request) { response in
            
            switch response {
            case .success(let data):
                //self.updateCell(data)
                completion(.success(data))
                return
            case .failure(let error):
                completion(.failure(error))
                return
            }
        }
    }
}
