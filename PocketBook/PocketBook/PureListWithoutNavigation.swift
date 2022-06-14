//
//  PureListWithoutNavigation.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/16.
//

import SwiftUI

struct PureListWithoutNavigation: View {

    @EnvironmentObject var modelData: ModelData
    var state: String
    
    var filteredBills: [Bill] {
         modelData.bills.filter { bill in
                (bill.branch==state || state=="all")
            }
        }

    var body: some View {
            NavigationView {
                List{
                    ForEach(filteredBills){
                    bill in BillRow(bill: bill)
                }
                .navigationTitle("Recent Bills")
                }
            }
            .onAppear(perform: {
                modelData.refresh()
            })
            .padding(.leading, -6.0)
            .background(.white)
            
        }
    }


struct PureListWithoutNavigation_Previews: PreviewProvider {
    static var previews: some View {
        PureListWithoutNavigation(state: "all")
            .environmentObject(ModelData())
    }
}
