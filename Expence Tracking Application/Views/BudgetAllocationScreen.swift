//
//  BudgetAllocationScreen.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//
import SwiftUI

struct BudgetAllocationView: View {
    @State private var categoryID: Int = 0
    @State private var from_date = Date()
    @State private var to_date = Date()
    @State private var amount = ""
    @State private var userID: Int = 11 // Set a valid user ID here
    
    @ObservedObject var viewModel = GetCategoryViewModel()
    @ObservedObject var budgetAllocationViewModel = BudgetAllocationViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Enter Budget Allocation")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 30)
                    
                    Text("Enter budget allocation for each category.")
                        .foregroundColor(Color.black.opacity(0.4))

                    Picker("Select Category", selection: $categoryID) {
                        ForEach(viewModel.items, id: \.id) { item in
                            Text(item.name).tag(item.id)
                        }
                    }
                    
                    DatePicker("From Date", selection: $from_date, displayedComponents: .date)
                    DatePicker("To Date", selection: $to_date, displayedComponents: .date)
                    
                    TextField("Amount", text: $amount)
                    
                    Button(action: {
                        // Create a BudgetAllocation object and save it
                        let budgetAllocation = BudgetAllocation(
                            categoryID: categoryID,
                            fromDateString: fromDateToString(from_date),
                            toDateString: fromDateToString(to_date),
                            amount: Double(amount) ?? 0.0,
                            userID: userID
                        )
                        
                        budgetAllocationViewModel.saveBudgetAllocation(budgetAllocation: budgetAllocation) { success in
                            if success {
                                // Handle success, e.g., navigate to a success screen or show an alert
                                print("Budget Allocation saved successfully")
                            } else {
                                // Handle failure, e.g., show an error message
                                print("Failed to save Budget Allocation")
                            }
                        }
                    }) {
                        Text("Save Allocation")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color("PrimaryColor"))
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .onAppear {
                if viewModel.items.isEmpty {
                    viewModel.fetchData()
                } else {
                    if let firstItem = viewModel.items.first {
                        categoryID = firstItem.id
                    }
                }
            }
        }
    }
    
    // Helper function to convert Date to String
    func fromDateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}

struct BudgetAllocationView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetAllocationView()
    }
}



//func getCategory(completion: @escaping (Result<[Response], Error>) -> Void) {
//    guard let url = URL(string: "http://127.0.0.1:8000/api/view") else {
//        return
//    }
//
//    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//        guard let data = data, error == nil else {
//            completion(.failure(error ?? CustomError.unknown)) // Handle the error
//            return
//        }
//
//        do {
//            let results = try JSONDecoder().decode([Response].self, from: data)
//            let category = results
//            DispatchQueue.main.async {
//                completion(.success(category))
//            }
//        } catch {
//            completion(.failure(error))
//        }
//    }
//    task.resume()
//}
