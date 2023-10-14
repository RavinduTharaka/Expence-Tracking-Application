


import Foundation
import Combine

class ExpenseViewModel: ObservableObject {
    @Published var Message: String = ""
    @Published var myData = Expense(userID: 0, categoryID: 0, description: "", date: "", amount: 0.0, location: "")

    func saveExpense(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:8000/api/addEx") else {
            completion(false)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        do {
            let jsonData = try JSONEncoder().encode(myData)
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            completion(false)
            return
        }

        let session = URLSession.shared
        session.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error: \(error)")
                completion(false)
                return
            }

            if let data = data {
                do {
                    let jsonResponse = try JSONDecoder().decode(Expense.self, from: data)
                    completion(true)
                    self.Message = "Expense Successfully Saved For Given Date Period"
                } catch {
                    completion(false)
                }
            } else {
                completion(false)
            }
        }.resume()
    }
}
