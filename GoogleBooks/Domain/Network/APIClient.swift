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
    
    let baseEndpoint = Constants.url.baseEndpoint
    let session = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<BookResponse<T.Response>>) {
        
        let urlString = "\(baseEndpoint)\(request.resourceName)"
        let endpoint = URL(string: urlString)!
        
        dataTask?.cancel()
        
        dataTask = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            
            if let data = data {
                do {
                    let bookResponse = try JSONDecoder().decode(BookResponse<T.Response>.self, from: data)
                    completion(.success(bookResponse))
                } catch {
                    completion(.failure(BookError.decoding))
                }
            }
        }
        
        dataTask?.resume()
    }
    
    func getThumbnail<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<Data>) {
        
        let endpoint = URL(string: request.resourceName)!
        
        dataTask?.cancel()
        
        dataTask = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(BookError.decoding))
                return
            }
            completion(.success(data))
        }
        
        dataTask?.resume()
    }

}
