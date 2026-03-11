//
//  Expense.swift
//  CentWise
//
//  Created by Fathi Ali on 2026-02-06.
//

import Foundation

struct Expense: Identifiable {
    let id = UUID()
    var name: String
    var amount: Double
    var date: Date
    var category: String
    
    // This static data helps us visualize the design immediately
    static let sampleData: [Expense] = [
        Expense(name: "Lunch at Joe's", amount: 12.50, date: Date(), category: "Food"),
        Expense(name: "Uber to Airport", amount: 45.00, date: Date(), category: "Transport"),
        Expense(name: "Netflix Subscription", amount: 15.99, date: Date(), category: "Entertainment")
    ]
}

