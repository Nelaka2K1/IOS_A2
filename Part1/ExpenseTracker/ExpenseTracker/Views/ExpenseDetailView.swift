import SwiftUI

struct ExpenseDetailView: View {
    let expense: Expense
    @ObservedObject var viewModel: ExpenseViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with amount
            VStack(spacing: 16) {
                Text(expense.amount, format: .currency(code: "USD"))
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                    .padding(.top, 40)
                
                Text(expense.title)
                    .font(.title2)
                    .foregroundColor(.primary)
                
                HStack(spacing: 12) {
                    // Category badge
                    Text(expense.category)
                        .font(.subheadline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(20)
                    
                    // Date
                    Text(expense.date.formatted(date: .complete, time: .omitted))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.05), Color.blue.opacity(0.01)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .padding(.bottom, 30)
            
            // Details section
            VStack(alignment: .leading, spacing: 20) {
                detailRow(icon: "calendar", title: "Date", value: expense.date.formatted(date: .abbreviated, time: .omitted))
                detailRow(icon: "tag", title: "Category", value: expense.category)
                detailRow(icon: "note.text", title: "Notes", value: expense.title)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .padding(.horizontal)
            .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
            
            Spacer()
            
            // Delete button
            Button(action: {
                showingDeleteAlert = true
            }) {
                HStack {
                    Image(systemName: "trash")
                    Text("Delete Expense")
                }
                .foregroundColor(.red)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)
            }
            .padding(.bottom, 30)
        }
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Expense", isPresented: $showingDeleteAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                viewModel.deleteExpense(expense)
                dismiss()
            }
        } message: {
            Text("Are you sure you want to delete this expense? This action cannot be undone.")
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
    
    private func detailRow(icon: String, title: String, value: String) -> some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .frame(width: 24)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title.uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(value)
                    .foregroundColor(.primary)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    NavigationView {
        ExpenseDetailView(
            expense: Expense(
                title: "Grocery Shopping",
                amount: 85.99,
                category: "Food",
                date: Date()
            ),
            viewModel: ExpenseViewModel()
        )
    }
}
