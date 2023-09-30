//
//  BudgetAllocationScreen.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//

import SwiftUI

struct BudgetAllocationScreen: View {
    @State var category_id = ""
    @State var category_name = ""
    @State var from_date = Date()
    @State var to_date = Date()
    @State var amount = ""

    var body: some View {
        VStack{
             Text("Enter Budget Allocation")
                 .font(.largeTitle)
                 .fontWeight(.bold)
                 .padding(.bottom, 30)
             
            Text("Enter budget allocation for each categories.")
                .foregroundColor(Color.black.opacity(0.4))
            
            TextField("Category Id", text: $category_id)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            TextField("Category Name", text: $category_name)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            DatePicker("From Date", selection: $from_date, displayedComponents: .date)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            DatePicker("To Date", selection: $to_date, displayedComponents: .date)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            TextField("Amount", text: $category_name)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            Button(action: {
 //               signInButtonTapped()
            }) {
                Text("Save Allocation")
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background { Color("PrimaryColor") }
                    .cornerRadius(10)
            }
            .padding()
             
         }
    }
}

struct BudgetAllocationScreen_Previews: PreviewProvider {
    static var previews: some View {
        BudgetAllocationScreen()
    }
}

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
