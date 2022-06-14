//
//  Bill.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/13.
//

import Foundation
import SwiftUI


struct Bill: Hashable, Codable, Identifiable{
    
    init(){
        self.id=UUID().uuidString
        self.branch="income"
        self.amount=0
        self.category="food"
        self.method="credit card"
        self.date=Date.now
        self.description=""
    }
    
    // cite: .https://developer.apple.com/forums/thread/651802?answerId=624572022#624572022
//    var id: UUID {return UUID()}
    var id: String
    var branch: String //income or expense
    var amount: Double
    var category: String
    var date: Date
    var method: String
    var description: String
}



func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY/MM/dd"
    return dateFormatter.string(from: date)
}
