//
//  BillRow.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/14.
//

import SwiftUI

struct BillRow: View {
    
    let darkBlue = Color(red: 0.098, green: 0.098, blue: 0.43)
    
    let darkRed = Color(red: 0.7, green: 0.09, blue: 0.121)
    
    var bill: Bill
    
    var body: some View {
        
        
        let moneyColor=(bill.branch=="income" ? darkBlue : darkRed)
        
        HStack{
            Image(bill.category)
                .resizable()
                .frame(width: 30, height: 30)
            Text(bill.category.capitalized)
                .font(.title2)
            Spacer()
            VStack(alignment:.trailing){
                Text(String(format: "$%.2f", bill.amount))
                    .font(.title3)
                    .foregroundColor(moneyColor)
                
                Text(formatDate(date:bill.date))
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct BillRow_Previews: PreviewProvider {
    static var bills=ModelData().bills
    
    static var previews: some View {
        Group{
            BillRow(bill: bills[0])
                .previewLayout(.fixed(width: 340, height: 70))
            BillRow(bill: bills[1])
                .previewLayout(.fixed(width: 340, height: 70))
        }
        
    }
}
