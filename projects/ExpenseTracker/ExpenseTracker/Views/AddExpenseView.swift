//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by Fathi Ali on 2025-06-22.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ExpenseViewModel

    @State private var title = ""
    @State private var amount = ""
    @State private var category = ""
    @State private var date = Date()

    let categories = ["Food", "Transport", "Entertainment", "Bills", "Other"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Expense Details")) {
                    TextField("Title", text: $title)

                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)

                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { cat in
                            Text(cat)
                        }
                    }

                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }

                Section {
                    Button("Save Expense") {
                        if let amountValue = Double(amount), !title.isEmpty, !category.isEmpty {
                            viewModel.addExpense(title: title, amount: amountValue, category: category, date: date)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .disabled(title.isEmpty || amount.isEmpty || category.isEmpty)
                }
            }
            .navigationTitle("Add Expense")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
