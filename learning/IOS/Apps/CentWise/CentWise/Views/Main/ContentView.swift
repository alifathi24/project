//
//  ContentView.swift
//  CentWise
//
//  Created by Fathi Ali on 2026-02-06.
//

import SwiftUI

struct ContentView: View {
    // We use the sample data we created in Step 1
    @State private var expenses: [Expense] = Expense.sampleData
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    HStack {
                        // Left side: Name and Category
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)
                            Text(expense.category)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        // Right side: Amount
                        Text(expense.amount, format: .currency(code: "USD"))
                            .bold()
                            .foregroundStyle(expense.amount > 100 ? .red : .primary) // Highlight high expenses
                    }
                }
                .onDelete(perform: removeExpense) // Enables swipe-to-delete
            }
            .navigationTitle("CentWise")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddExpenseView()
            }
        }
    }
    
    // A simple function to handle swipe-to-delete
    func removeExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
