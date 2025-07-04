//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Fathi Ali on 2025-06-22.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ExpenseViewModel()
    @State private var showingAddExpense = false

    // Filters
    @State private var selectedCategory = "All"
    @State private var sortBy = "Date ↓"
    @State private var dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let start = calendar.date(byAdding: .month, value: -1, to: Date())!
        return start...Date()
    }()

    let categories = ["All", "Food", "Transport", "Entertainment", "Bills", "Other"]
    let sortOptions = ["Date ↓", "Date ↑", "Amount ↓", "Amount ↑"]

    var filteredExpenses: [Expense] {
        var result = viewModel.expenses.filter { expense in
            (selectedCategory == "All" || expense.category == selectedCategory)
            && dateRange.contains(expense.date)
        }

        switch sortBy {
        case "Date ↓":
            result.sort { $0.date > $1.date }
        case "Date ↑":
            result.sort { $0.date < $1.date }
        case "Amount ↓":
            result.sort { $0.amount > $1.amount }
        case "Amount ↑":
            result.sort { $0.amount < $1.amount }
        default:
            break
        }

        return result
    }

    var body: some View {
        NavigationView {
            VStack {
                // Filter Controls
                HStack {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category).tag(category)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())

                    Picker("Sort By", selection: $sortBy) {
                        ForEach(sortOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding(.horizontal)

                // Date Range Picker
                DatePicker("From", selection: Binding(
                    get: { dateRange.lowerBound },
                    set: { dateRange = $0...dateRange.upperBound }),
                    displayedComponents: [.date])
                    .padding(.horizontal)

                DatePicker("To", selection: Binding(
                    get: { dateRange.upperBound },
                    set: { dateRange = dateRange.lowerBound...$0 }),
                    displayedComponents: [.date])
                    .padding(.horizontal)

                // Expense List
                List {
                    ForEach(filteredExpenses) { expense in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(expense.title)
                                    .font(.headline)
                                Spacer()
                                Text("$\(expense.amount, specifier: "%.2f")")
                                    .font(.subheadline)
                            }
                            Text("\(expense.category) • \(expense.date.formatted(date: .abbreviated, time: .omitted))")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                    .onDelete(perform: viewModel.deleteExpense)
                }
            }
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddExpense = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            
            .sheet(isPresented: $showingAddExpense) {
                AddExpenseView(viewModel: viewModel)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddExpense = true
                    }) {
                        Image(systemName: "plus")
                    }

                    NavigationLink(destination: ExpenseChartView(viewModel: viewModel)) {
                        Image(systemName: "chart.bar.doc.horizontal")
                    }
                }
            }

        }
        
        
    }
    
}




#Preview {
    ContentView()
}
