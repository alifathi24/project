//
//  ExpenseChartView.swift
//  ExpenseTracker
//
//  Created by Fathi Ali on 2025-06-22.
//

import SwiftUI
import Charts

struct ExpenseChartView: View {
    @ObservedObject var viewModel: ExpenseViewModel

    var groupedByCategory: [String: Double] {
        Dictionary(grouping: viewModel.expenses) { $0.category }
            .mapValues { $0.reduce(0) { $0 + $1.amount } }
    }

    var dailySpending: [(date: Date, total: Double)] {
        let grouped = Dictionary(grouping: viewModel.expenses) { expense in
            Calendar.current.startOfDay(for: expense.date)
        }
        return grouped.map { (date: $0.key, total: $0.value.reduce(0) { $0 + $1.amount }) }
            .sorted(by: { $0.date < $1.date })
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Expenses by Category")
                    .font(.headline)
                    .padding(.horizontal)

                Chart {
                    ForEach(groupedByCategory.sorted(by: { $0.key < $1.key }), id: \.key) { category, total in
                        BarMark(
                            x: .value("Category", category),
                            y: .value("Total", total)
                        )
                        .foregroundStyle(by: .value("Category", category))
                    }
                }
                .frame(height: 250)
                .padding()

                Divider()

                Text("Spending Over Time")
                    .font(.headline)
                    .padding(.horizontal)

                Chart {
                    ForEach(dailySpending, id: \.date) { entry in
                        LineMark(
                            x: .value("Date", entry.date),
                            y: .value("Amount", entry.total)
                        )
                        .interpolationMethod(.monotone)
                    }
                }
                .frame(height: 250)
                .padding()
            }
        }
        .navigationTitle("Expense Charts")
    }
}
