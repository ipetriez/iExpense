//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Sergey Petrosyan on 25.02.24.
//

import Foundation

struct ExpenseItem: Codable {
    let name: String
    let type: String
    let amount: Double
}
