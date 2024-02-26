//
//  ContentView.swift
//  iExpense
//
//  Created by Sergey Petrosyan on 25.02.24.
//

import SwiftUI

struct ExpensesView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpenseView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                // MARK: — Simpler approach for calling func removeItems(at:)
                // .onDelete(perform: removeItems)
                .onDelete(perform: { indexSet in
                    removeItems(at: indexSet)
                })
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense", systemImage: "plus") {
                    let expense = ExpenseItem(id: UUID(), name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                }
            }
            .sheet(isPresented: $showingAddExpenseView) {
                AddExpenseView()
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ExpensesView()
}
