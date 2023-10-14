


import Foundation
import Combine

class BudgetAllocationViewModel: ObservableObject {
    @Published var Message: String = ""
    
    func saveBudgetAllocation(budgetAllocation: BudgetAllocation, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:8000/api/insert1") else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Serialize the data as JSON and set the request body
        do {
            let jsonData = try JSONEncoder().encode(budgetAllocation)
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            completion(false)
            return
        }
        
        // Create a URLSession data task to send the data
        let session = URLSession.shared
        session.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error: \(error)")
                completion(false)
                return
            }
            
            if let data = data {
                do {
                    let jsonResponse = try JSONDecoder().decode(BudgetAllocation.self, from: data)
                    // You can process the response as needed
                    completion(true)
                    self.Message = "Budget Allocation Successfully Saved For Given Date Period"
                } catch {
                    completion(false)
                }
            } else {
                completion(false)
            }
        }.resume()
    }
}
