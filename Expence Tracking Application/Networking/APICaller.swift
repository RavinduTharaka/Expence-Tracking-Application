//
//  APICaller.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//

import Foundation


enum APIError: Error {
    
    case failedTogetData
}


class APICaller {
    
    static let shared = APICaller()
    
    func getCategory(completion: @escaping (Result<[Response], Error>) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:8000/api/view") else {
            return
        }
         
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? CustomError.unknown)) // Handle the error
                return
            }
            
            do {
                let results = try JSONDecoder().decode([Response].self, from: data)
                let category = results
                DispatchQueue.main.async {
                    completion(.success(category))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

struct Response: Codable {
    // Define your Response structure based on the JSON data
}

enum CustomError: Error {
    case unknown
}
