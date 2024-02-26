//
//  Expenses.swift
//  iExpense
//
//  Created by Sergey Petrosyan on 25.02.24.
//

import Foundation

@Observable
final class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: data) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
