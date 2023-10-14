//
//  ExpenceModel.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-10-10.
//

import Foundation

struct Expense: Codable {
    var userID: Int
    var categoryID: Int
    var description: String
    var date: String
    var amount: Double
    var location: String
}
