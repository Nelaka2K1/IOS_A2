import Foundation

struct Expense: Identifiable, Codable {
    let id: UUID
    var title: String
    var amount: Double
    var category: String
    var date: Date
    
    init(id: UUID = UUID(), title: String, amount: Double, category: String, date: Date = Date()) {
        self.id = id
        self.title = title
        self.amount = amount
        self.category = category
        self.date = date
    }
}

// Sample categories
enum ExpenseCategory: String, CaseIterable, Identifiable {
    case food = "🍔 Food"
    case transportation = "🚗 Transportation"
    case shopping = "🛍️ Shopping"
    case bills = "💸 Bills"
    case entertainment = "🎬 Entertainment"
    
    var id: String { self.rawValue }
    
}
