//
//  AddExpenseView.swift
//  CentWise
//
//  Created by Fathi Ali on 2026-02-06.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    
    // These variables hold the user's input temporarily
    @State private var name = ""
    @State private var amount = 0.0
    @State private var category = "Food"
    @State private var date = Date()
    
    let categories = ["Food", "Transport", "Housing", "Entertainment", "Health"]

    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    TextField("Expense Name", text: $name)
                    
                    TextField("Amount", value: $amount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad) // Shows number pad only
                }
                
                Section("Category & Date") {
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { categoryName in
                            Text(categoryName)
                        }
                    }
                    
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        // We will add the save logic in the next phase
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddExpenseView()
}
