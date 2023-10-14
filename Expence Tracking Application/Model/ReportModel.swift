
import Foundation

struct ReportItem: Codable {
    let id: Int
    let date: String
    let discription: String
    let amount: Double
    // Add other properties as needed
    
    private enum CodingKeys: String, CodingKey {
           case id = "id"
           case date = "date"
         case discription = "discription"
        case amount = "amount"
       }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(date)
        hasher.combine(discription)
        hasher.combine(amount)
    }
}
