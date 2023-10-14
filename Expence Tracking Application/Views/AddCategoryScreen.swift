//
//  AddCategoryScreen.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//

import SwiftUI

struct AddCategoryScreen: View {
//    @State var category_id = ""
    @State var category_name =  ""
//    @StateObject var AddCatVM: AddCategoryViewModel = AddCategoryViewModel()
    @ObservedObject var viewModel = CategoryVM()
    @State private var isSaved = false
    
    var body: some View {
       VStack{
            Text("Enter Expence Categories")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
           Text("Enter New Categories which you need to assign expences.")
               .foregroundColor(Color.black.opacity(0.4))
           
//           TextField("Category Id", text: $category_id)
//               .padding()
//               .frame(width: 300, height: 50)
//               .background(Color.black.opacity(0.05))
//               .cornerRadius(10)
           TextField("Category Name", text: $viewModel.myData.Category_name)
               .padding()
               .frame(width: 300, height: 50)
               .background(Color.black.opacity(0.05))
               .cornerRadius(10)
           
           Button(action: {
               
//               self.saveTapped()

               
                  viewModel.saveData { success in
                      if success {
                          // Handle successful save, e.g., show an alert
                          print("Data saved successfully")
                      } else {
                          // Handle save failure, e.g., show an alert
                          print("Data save failed")
                      }
                  }
              
           }) {
               Text("Save Category")
                   .foregroundColor(.white)
                   .frame(width: 300, height: 50)
                   .background { Color("PrimaryColor") }
                   .cornerRadius(10)
           }
           .padding()
            
        }
    }
    
//    func saveTapped() {
//        let parameters = [
//            "category_name": AddCatVM.category_name
//        ]
//
//        guard let url = URL(string: "http://127.0.0.1:8000/api/addCat") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let session = URLSession.shared
//        session.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error: \(error)")
//                // Handle the error, e.g., show an alert to the user
//                return
//            }
//
//            guard let data = data else {
//                print("No data")
//                // Handle the absence of data, e.g., show an alert to the user
//                return
//            }
//
//            do {
//                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                    // Handle the JSON response from the API, e.g., check for success and update the UI accordingly.
//                    // For example, if the API returns a success flag:
//                    if let success = json["success"] as? Bool, success {
//                        // Update the UI or perform any action for a successful response
//                        DispatchQueue.main.async {
//                            // You can set isSaved to true here if it represents a successful save
//                            isSaved = true
//
//                            // Display a "saved successfully" message to the user
//                            let alertController = UIAlertController(title: "Success", message: "Saved successfully", preferredStyle: .alert)
//                            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
////                            AddCategoryScreen.present(alertController, animated: true, completion: nil)
//                        }
//                    } else {
//                        // Handle API error response or other conditions
//                        _ = UIAlertController(title: "Type Category", message: "Error", preferredStyle: .alert)
//                    }
//                }
//            } catch let error {
//                print("Error serializing JSON: \(error)")
//                // Handle JSON parsing error, e.g., show an alert to the user
//            }
//        }.resume()
//    }


}

struct AddCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryScreen()
    }
}
