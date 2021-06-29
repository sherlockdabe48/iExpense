//
//  AddView.swift
//  iExpense
//
//  Created by Antarcticaman on 29/6/2564 BE.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @ObservedObject var expenses: Expenses 
    @Environment(\.presentationMode) var presentationMode
    
    static let types = ["Business", "Personal"]
    var body: some View {
        NavigationView {
                Form {
                    
                    TextField("Name", text: $name)
                    Picker("Type", selection: $type) {
                        ForEach(Self.types, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Amount", text: $amount)
                        .keyboardType(.numberPad)
                }
                
            .navigationTitle("Add new expense")
                .navigationBarItems(trailing: Button("Save") {
                    if let actualAmount = Int(self.amount) {
                        let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                        self.expenses.items.append(item)
                    }
                    self.presentationMode.wrappedValue.dismiss()
                })
        }
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
