//
//  HomeScreen.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        
        TabView{
            AddCategoryScreen().tabItem(){
                Image(systemName: "list.bullet.circle")
                Text("Category")
            }
            
            AddExpencesScreen().tabItem(){
                Image(systemName: "dollarsign.circle.fill")
                Text("Expences")
            }
            
            BudgetAllocationScreen().tabItem(){
                Image(systemName: "list.bullet.clipboard")
                Text("Budget")
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
