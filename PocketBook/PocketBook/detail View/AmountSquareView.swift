//
//  AmountSquare.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/13.
//

import SwiftUI

struct AmountSquareView: View {
    var branch: String
    var amount: Double
    
    var body: some View {
        HStack{
            Image(branch)
                .resizable()
                .frame(width: 30, height: 30)
            Text(branch.capitalized)
                    .font(.title)
              Spacer()
            Text("$ \(String(amount))")
                    .font(.title)
            }
        .padding()
    }
}



struct AmountSquareView_Previews: PreviewProvider {
    static var previews: some View {
        AmountSquareView(branch: "income", amount: 1500.00)
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
