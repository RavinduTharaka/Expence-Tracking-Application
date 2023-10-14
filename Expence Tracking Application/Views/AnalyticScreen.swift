//
//  AnalyticScreen.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//

import SwiftUI
struct ReportView: View {
    @ObservedObject var viewModel = ReportViewModel()
    @State private var showErrorAlert = false
    
    var body: some View {
        NavigationView {
            List(viewModel.reportData, id: \.id) { item in
                VStack(alignment: .leading) {
                    Text(item.date)
                        .font(.headline)
                    Text(item.discription)
                        .font(.subheadline)
                    Text("Amount: \(item.amount)")
                        .font(.subheadline)
                }
            }
            .onAppear {
                viewModel.fetchData { success in
                    if !success {
                        showErrorAlert = true
                    }
                }
            }

            .alert(isPresented: $showErrorAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Failed to fetch data. Please try again later."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .navigationBarTitle("Reports")
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}

