//
//  SubcountView.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/12.
//

import SwiftUI

struct SubcountView: View {
    var branch: String
    var amount: Double
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Spacer()
                Image(branch)
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            Text("Total \(branch)")
                .font(.subheadline)
            Text(String(format: "$%.2f", amount))
                .font(.title2)
                .fontWeight(.bold)
                
        }
        .padding()
    }
}

struct SubcountView_Previews: PreviewProvider {
    static var previews: some View {
        SubcountView(branch: "income",amount: 2000)
            .previewLayout(.fixed(width: 160, height: 120))
    }
}
