//
//  APICaller.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//

import Foundation


//
//enum APIError: Error {
//
//    case failedTogetData
//}
//
//
//class APICaller {
//
//    static let shared = APICaller()
//
//    func getBreakfast(completion: @escaping (Result<[Response], Error>)->Void){
//        guard let url = URL(string: "http://127.0.0.1:8000/api/food")else {return}
//
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            do {
//                let results = try JSONDecoder().decode([Response].self, from: data)
//                let breakfast = Array(results.prefix(5))
//                completion(.success(breakfast))
//            }catch{
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
//}
