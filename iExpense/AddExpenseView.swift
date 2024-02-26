//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Sergey Petrosyan on 26.02.24.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    let types = ["Business", "Personal"]
    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(id: UUID(), name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddExpenseView(expenses: Expenses())
}
