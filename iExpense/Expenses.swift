//
//  Expenses.swift
//  iExpense
//
//  Created by Sabesh Bharathi on 18/07/20.
//  Copyright © 2020 Sabesh Bharathi. All rights reserved.
//

import Foundation

class Expenses: ObservableObject {
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
    
    
    @Published var items: [ExpenseItem] {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(items) {
                UserDefaults.standard.set(data, forKey: "Items")
            }
        }
    }
}
