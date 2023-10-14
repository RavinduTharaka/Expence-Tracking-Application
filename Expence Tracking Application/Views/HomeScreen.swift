//
//  HomeScreen.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            TabView{
                AddCategoryScreen().tabItem(){
                    Image(systemName: "list.bullet.circle")
                    Text("Category")
                }
                
                AddExpensesScreen().tabItem(){
                    Image(systemName: "dollarsign.circle.fill")
                    Text("Expences")
                }
                
                BudgetAllocationView().tabItem(){
                    Image(systemName: "list.bullet.clipboard")
                    Text("Budget")
                }
                
                ReportView().tabItem(){
                    Image(systemName: "chart.bar.xaxis")
                    Text("Analytics")
                }
                
            }
        }.navigationBarHidden(true)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
