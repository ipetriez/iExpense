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
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    }
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
                    showingAddExpenseView.toggle()
                }
            }
            .sheet(isPresented: $showingAddExpenseView) {
                AddExpenseView(expenses: expenses)
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
