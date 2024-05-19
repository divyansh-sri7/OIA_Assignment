//
//  Data.swift
//  OIA_assignment
//
//  Created by Divyansh Srivastava on 19/05/24.
//

import Foundation
struct Data: Identifiable {
    let month: String
    let amount: Double
    let id = UUID()


    init(month: String, amount: Double) {
        self.month = month
        self.amount = amount
    }
}
