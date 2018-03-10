//
//  APIClient.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation
import UIKit

public class APIClient {
    
    let baseEndpoint = "https://www.googleapis.com/books/v1/"
    let session = URLSession(configuration: .default)
    
    func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<BookResponse<T.Response>>) {
        
        let endpoint = URL(string: "\(baseEndpoint)\(request.resourceName)")!
        
        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            
            if let data = data {
                do {
                    let bookResponse = try JSONDecoder().decode(BookResponse<T.Response>.self, from: data)
                    completion(.success(bookResponse))
                } catch {
                    completion(.failure(BookError.decoding))
                }
            }
        }
        
        task.resume()
    }
    
}

