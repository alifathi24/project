//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Fathi Ali on 2025-06-22.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = []

    // MARK: - Add Expense
    func addExpense(title: String, amount: Double, category: String, date: Date = Date()) {
        let newExpense = Expense(title: title, amount: amount, category: category, date: date)
        expenses.append(newExpense)
        saveExpenses()
    }

    // MARK: - Delete Expense
    func deleteExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
        saveExpenses()
    }

    // MARK: - Persistence (UserDefaults - can later be upgraded to CoreData)
    private let key = "expenses_key"

    init() {
        loadExpenses()
    }

    private func saveExpenses() {
        if let data = try? JSONEncoder().encode(expenses) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func loadExpenses() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Expense].self, from: data) {
            self.expenses = decoded
        }
    }
}

