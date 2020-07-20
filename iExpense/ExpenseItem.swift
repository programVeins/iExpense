//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Sabesh Bharathi on 18/07/20.
//  Copyright © 2020 Sabesh Bharathi. All rights reserved.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
