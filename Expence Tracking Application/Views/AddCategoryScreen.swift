//
//  AddCategoryScreen.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//

import SwiftUI

struct AddCategoryScreen: View {
    @State var category_id = ""
    @State var category_name =  ""
    var body: some View {
       VStack{
            Text("Enter Expence Categories")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
           Text("Enter New Categories which you need to assign expences.")
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
           
           Button(action: {
//               signInButtonTapped()
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
}

struct AddCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryScreen()
    }
}
