import Foundation
import SwiftUI
import Combine

@MainActor
final class ExpenseViewModel: ObservableObject {
    @Published private(set) var expenses: [Expense] = []
    private let predictor = ExpensePredictor()
    private let saveKey = "ExpenseData"
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadExpenses()
        if expenses.isEmpty {
            // Add sample data if no saved data
            expenses = [
                Expense(title: "Grocery Shopping", amount: 85.99, category: "Food"),
                Expense(title: "Electric Bill", amount: 120.0, category: "Bills"),
                Expense(title: "Movie Tickets", amount: 35.50, category: "Entertainment")
            ]
        }
    }
    
    func addExpense(_ expense: Expense) {
        expenses.append(expense)
        saveExpenses()
    }
    
    func deleteExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
        saveExpenses()
    }
    
    func deleteExpense(_ expense: Expense) {
        if let index = expenses.firstIndex(where: { $0.id == expense.id }) {
            expenses.remove(at: index)
            saveExpenses()
        }
    }
    
    func autoCategorize(amount: Double) -> String {
        return predictor.predictCategory(amount: amount)
    }
    
    private func saveExpenses() {
        do {
            let data = try JSONEncoder().encode(expenses)
            UserDefaults.standard.set(data, forKey: saveKey)
        } catch {
            print("Error saving expenses: \(error)")
        }
    }
    
    private func loadExpenses() {
        guard let data = UserDefaults.standard.data(forKey: saveKey) else {
            expenses = []
            return
        }
        
        do {
            expenses = try JSONDecoder().decode([Expense].self, from: data)
        } catch {
            print("Error loading expenses: \(error)")
            expenses = []
        }
    }
}
