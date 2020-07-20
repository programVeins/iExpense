//
//  ContentView.swift
//  iExpense
//
//  Created by Sabesh Bharathi on 17/07/20.
//  Copyright © 2020 Sabesh Bharathi. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    
    @State var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                           VStack(alignment: .leading) {
                               Text(item.name)
                                   .font(.headline)
                               Text(item.type)
                                .font(.subheadline)
                           }

                           Spacer()
                           Text("$\(item.amount)")
                            .font(item.amount > 100 ? .headline : .subheadline)
                       }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Holler Dollar")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showingAddExpense = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: self.expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
