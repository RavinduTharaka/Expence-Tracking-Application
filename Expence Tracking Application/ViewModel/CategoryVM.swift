//
//  CategoryVM.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-10-09.
//

import Foundation
import Combine

class CategoryVM: ObservableObject {
    @Published var myData = CategoryModel(Category_name: "")
    
    func saveData(completion: @escaping (Bool) -> Void) {
        // Define the URL for your Laravel API
        guard let url = URL(string: "http://127.0.0.1:8000/api/addCat") else {
            completion(false)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // Serialize the data as JSON and set the request body
        do {
            let jsonData = try JSONEncoder().encode(myData)
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            completion(false)
            return
        }

        // Create a URLSession data task to send the data
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(false)
                return
            }

            // Handle the API response
            if let data = data {
                do {
                    let jsonResponse = try JSONDecoder().decode(CategoryModel.self, from: data)
                    // You can process the response as needed
                    completion(true)
                } catch {
                    completion(false)
                }
            } else {
                completion(false)
            }
        }.resume()
    }
}


class GetCategoryViewModel: ObservableObject {
    @Published var items: [GetCategory] = []
    private var cancellable: AnyCancellable?

    init() {
        fetchData()
    }

    func fetchData() {
        guard let url = URL(string: "http://127.0.0.1:8000/api/views") else {
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [GetCategory].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                // Handle completion, e.g., error handling
            }, receiveValue: { [weak self] items in
                self?.items = items
            })
    }
}
