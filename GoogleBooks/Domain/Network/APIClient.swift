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
    
    func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>) {
        
        let urlString = "\(baseEndpoint)\(request.resourceName)"
        let endpoint = URL(string: urlString)!
        
        dataTask?.cancel()
        
        dataTask = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            
            //TODO: Check for error!!
            
            if let data = data {
                do {
                    let bookResponse = try JSONDecoder().decode(T.Response.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(.success(bookResponse))
                    }
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
            
            //TODO: Check for error!!
            
            guard let data = data, error == nil else {
                completion(.failure(BookError.decoding))
                return
            }
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }
        
        dataTask?.resume()
    }
}
