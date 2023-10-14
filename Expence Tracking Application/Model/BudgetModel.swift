

import Foundation

struct BudgetAllocation: Codable {
    var categoryID: Int
    var fromDateString: String // You might want to convert Date to String
    var toDateString: String   // You might want to convert Date to String
    var amount: Double
    var userID: Int
}



