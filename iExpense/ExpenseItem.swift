//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Sergey Petrosyan on 25.02.24.
//

import Foundation

enum ExpenseType: String {
    case personal, business
    
    var title: String {
        self.rawValue.capitalized
    }
}

struct ExpenseItem: Codable, Identifiable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
