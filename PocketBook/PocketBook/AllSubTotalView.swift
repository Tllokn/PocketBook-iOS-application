//
//  AllSubTotalView.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/13.
//

import SwiftUI
import SwiftPieChart

struct AllSubTotalView: View {
    var branch: String
    
    @EnvironmentObject var modelData: ModelData
    var filteredBills: [Bill] {
         modelData.bills.filter { bill in
                (bill.branch==branch)
            }
        }
    
    // This function helps to comput for each category, how much we spend and it will return (categories,moneyAmounts)
    func getCatAndvalue(allBills:[Bill]) -> ([String],[Double]){
        var cvdict=[String: Double]()
        let filteredBills=modelData.bills.filter { bill in
            (bill.branch==branch)
        }
        for curr_bill in filteredBills
        {
            if cvdict.keys.contains(curr_bill.category)
            {
                cvdict[curr_bill.category]=cvdict[curr_bill.category]!+curr_bill.amount
            }
            else{
                cvdict[curr_bill.category]=curr_bill.amount
            }
        }
        
        return ([String](cvdict.keys),[Double](cvdict.values))
    }
    
    var body: some View {
        VStack
        {
            Text("\(branch.capitalized) Analysis")
                .font(.largeTitle)
            
            PieChartView(
                values: getCatAndvalue(allBills: modelData.bills).1,
                names: getCatAndvalue(allBills: modelData.bills).0,
                formatter: {value in String(format: "$%.2f", value)},
                colors:[Color.blue, Color.green,Color.orange,Color.yellow,Color.red,Color.purple,Color.pink,Color.gray,Color.brown,Color.mint,Color.black],
                backgroundColor: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255, opacity: 1.0),
                widthFraction: 0.85
                )
                .onAppear(perform: {
                    modelData.refresh()
            })
                .padding()
            
            
            
        }
        
    }
}

struct AllSubTotalView_Previews: PreviewProvider {
    static var previews: some View {
        AllSubTotalView(branch: "income")
            .environmentObject(ModelData())
    }
}
