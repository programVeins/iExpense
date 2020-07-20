//
//  AddView.swift
//  iExpense
//
//  Created by Sabesh Bharathi on 18/07/20.
//  Copyright © 2020 Sabesh Bharathi. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var showingAlert = false
    
    let types = ["Personal", "Business"]
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name of Expense:", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(self.types, id: \.self) { type in
                        Text(type)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("WTF"), message: Text("Enter an amount not text 😤"), dismissButton: .default(Text("Okay")))
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let amountInt = Int(amount) {
                    let newItem = ExpenseItem(name: self.name, type: self.type, amount: amountInt)
                    self.expenses.items.append(newItem)
                    self.presentationMode.wrappedValue.dismiss()
                }
                else {
                    showingAlert.toggle()
                }
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
