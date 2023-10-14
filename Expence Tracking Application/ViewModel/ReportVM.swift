

import Foundation
import Combine

class ReportViewModel: ObservableObject {
//    @Published var reportData: [ReportItem] = []
//
//    func fetchData(completion: @escaping (Bool) -> Void)  {
//        guard let url = URL(string: "http://127.0.0.1:8000/api/getEX") else {
//            return
//        }
//
//        URLSession.shared.dataTaskPublisher(for: url)
//            .map(\.data)
//            .decode(type: [ReportItem].self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { _ in
//                // Handle completion, e.g., error handling
//            }, receiveValue: { [weak self] items in
//                self?.reportData = items
//            })
//        completion(true)
//    }
    
    @Published var reportData: [ReportItem] = []
    private var cancellable: AnyCancellable?

    init() {
        fetchData(completion: { success in
            // Handle the completion when the data is fetched
            if !success {
                // Handle the case when data fetching fails
                // You can show an error alert or perform any other actions
                print("Data fetching failed")
            }
        })
    }

    func fetchData(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:8000/api/getEX") else {
            completion(false) // Notify that fetching failed
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [ReportItem].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                // Handle completion, e.g., error handling
            }, receiveValue: { [weak self] items in
                self?.reportData = items
                completion(true) // Notify that fetching succeeded
            })
    }

    }

