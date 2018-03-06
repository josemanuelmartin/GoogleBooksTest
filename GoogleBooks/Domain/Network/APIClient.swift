//
//  APIClient.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation

class APIClient {
    
    let baseURL = "https://www.googleapis.com/books/v1/volumes?q="
    
    let session = URLSession(configuration: .default)
    var task: URLSessionDataTask?
    
    func searchBook(book: String) {
        task?.cancel()
        let url = URLRequest(url: URL(string: "\(baseURL)\(book)")!)
        
        task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard error == nil else {
                print(error ??? "Unidentified error")
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: responseData) as? [String: Any] else {
                print("JSONSerialization error!")
                return
            }
            
            guard let items = json!["items"] as? [[String: Any]] else {
                return
            }
            
            do {
                let books = try items.map{ try BookModel(json: $0) }
                print("BOOKS: \(books)")
            } catch let error {
                print(error)
            }
            
        })
        
        task?.resume()
    }
    
}
