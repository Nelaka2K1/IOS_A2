import SwiftUI

struct ExpenseCardView: View {
    let expense: Expense
    
    var body: some View {
        HStack(spacing: 16) {
            // Category icon container
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.1))
                    .frame(width: 50, height: 50)
                
                // Using SF Symbols for category icons
                Image(systemName: iconForCategory(expense.category))
                    .font(.title3)
                    .foregroundColor(.blue)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                // Title
                Text(expense.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                // Category
                Text(expense.category)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
            }
            
            Spacer()
            
            // Amount and date
            VStack(alignment: .trailing, spacing: 4) {
                // Amount
                Text(expense.amount, format: .currency(code: "USD"))
                    .font(.headline.bold())
                    .foregroundColor(.primary)
                
                // Date
                Text(expense.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
    }
    
    private func iconForCategory(_ category: String) -> String {
        switch category {
        case "Food": return "fork.knife"
        case "Bills": return "doc.text"
        case "Shopping": return "bag"
        case "Transportation": return "car"
        case "Entertainment": return "film"
        default: return "tag"
        }
    }
}

#Preview {
    ExpenseCardView(expense: Expense(
        title: "Sample Expense",
        amount: 99.99,
        category: "Shopping",
        date: Date()
    ))
    .padding()
}
