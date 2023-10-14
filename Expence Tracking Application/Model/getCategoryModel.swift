
import Foundation

struct GetCategory: Identifiable, Decodable, Hashable {
   var id: Int
    var name: String
    
    private enum CodingKeys: String, CodingKey {
           case id = "category_id"
           case name = "Category_name"
       }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }

    static func == (lhs: GetCategory, rhs: GetCategory) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}
