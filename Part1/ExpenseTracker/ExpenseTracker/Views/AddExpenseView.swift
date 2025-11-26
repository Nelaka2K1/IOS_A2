import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ExpenseViewModel
    
    @State private var title = ""
    @State private var amount = ""
    @State private var category = "Food"
    @State private var date = Date()
    @State private var showingError = false
    
    private let categories = ["Food", "Transportation", "Shopping", "Bills", "Entertainment"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Expense Details").font(.headline)) {
                    TextField("Title", text: $title)
                    
                    HStack {
                        Text("$")
                        TextField("Amount", text: $amount)
                            .keyboardType(.decimalPad)
                    }
                    
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { category in
                            Text(category).tag(category)
                        }
                    }
                    
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }
                .listRowBackground(Color(.secondarySystemGroupedBackground))
                
                Section {
                    Button("Predict Category") {
                        if let amountValue = Double(amount) {
                            let predictedCategory = viewModel.autoCategorize(amount: amountValue)
                            category = predictedCategory
                        }
                    }
                    .disabled(amount.isEmpty)
                }
                .listRowBackground(Color(.secondarySystemGroupedBackground))
            }
            .navigationTitle("Add Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveExpense()
                    }
                    .disabled(title.isEmpty || amount.isEmpty)
                }
            }
            .alert("Error", isPresented: $showingError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Please enter a valid amount")
            }
        }
    }
    
    private func saveExpense() {
        guard let amountValue = Double(amount) else {
            showingError = true
            return
        }
        
        let expense = Expense(
            title: title,
            amount: amountValue,
            category: category,
            date: date
        )
        
        viewModel.addExpense(expense)
        dismiss()
    }
}

#Preview {
    AddExpenseView(viewModel: ExpenseViewModel())
}
