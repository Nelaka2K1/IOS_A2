import Foundation
import SwiftUI

class ExpensePredictor {
    
    init() {}
    
    func predictCategory(amount: Double) -> String {
        // This is a simple rule-based predictor
        // In a real app, you would replace this with a trained CoreML model
        switch amount {
        case 0..<10: return "Food"
        case 10..<50: return "Shopping"
        case 50..<200: return "Bills"
        case 200...: return "Bills" // For high amounts, default to Bills
        default: return "Entertainment"
        }
    }
}
