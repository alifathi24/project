//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Fathi Ali on 2025-06-22.
//

import Foundation

struct Expense: Identifiable, Codable {
    let id: UUID
    var title: String
    var amount: Double
    var category: String
    var date: Date

    init(id: UUID = UUID(), title: String, amount: Double, category: String, date: Date = Date()) {
        self.id = id
        self.title = title
        self.amount = amount
        self.category = category
        self.date = date
    }
}
