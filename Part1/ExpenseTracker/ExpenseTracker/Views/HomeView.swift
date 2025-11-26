import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ExpenseViewModel()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                // Main content
                if viewModel.expenses.isEmpty {
                    emptyStateView
                } else {
                    expenseListView
                }
                
                // Floating action button
                FloatingActionButton(action: { showingAddExpense = true }, icon: "plus")
                    .padding()
            }
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddExpenseView(viewModel: viewModel)
            }
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 20) {
            Image(systemName: "dollarsign.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue.opacity(0.3))
            
            Text("No Expenses Yet")
                .font(.title2.bold())
            
            Text("Tap the + button to add your first expense")
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
    
    private var expenseListView: some View {
        List {
            ForEach(viewModel.expenses) { expense in
                NavigationLink(destination: ExpenseDetailView(expense: expense, viewModel: viewModel)) {
                    ExpenseCardView(expense: expense)
                        .padding(.vertical, 4)
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            .onDelete(perform: viewModel.deleteExpense)
            .listRowBackground(Color.clear)
        }
        .listStyle(PlainListStyle())
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    HomeView()
}
