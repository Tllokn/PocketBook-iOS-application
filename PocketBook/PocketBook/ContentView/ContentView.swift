//
//  ContentView.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/12.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    
    @EnvironmentObject var modelData: ModelData
    @AppStorage("LaunchTime") var LaunchTime: Int = 0
    
    
    // This function helps to compute the total balance, the income and the expense
    func getMoneyDict(Bills:[Bill]) -> [Double?]{
        var cvdict:[String: Double]=["all":0.0,"income":0.0,"expense":0.0]
        for curr_bill in Bills
        {
            if curr_bill.branch=="income"
            {
                cvdict["all"]=cvdict["all"]!+curr_bill.amount
                cvdict["income"]=cvdict["income"]!+curr_bill.amount
            }
            else
            {
                cvdict["all"]=cvdict["all"]!-curr_bill.amount
                cvdict["expense"]=cvdict["expense"]!+curr_bill.amount
            }
            
        }
        return [cvdict["all"],cvdict["income"],cvdict["expense"]]
    }
    

        
    var body: some View {
        NavigationView{
            VStack{
                    Text("Total Balance")
                        .font(.headline)
                        .onAppear(perform: {
                            LaunchTime+=1
                            if (LaunchTime==3)
                            {
                                if let scene = UIApplication.shared.connectedScenes.first(where: {$0.activationState == .foregroundActive}) as? UIWindowScene{
                                    SKStoreReviewController.requestReview(in: scene)
                                }
                            }
                        })
               
                Text(String(format: "$%.2f", getMoneyDict(Bills: modelData.bills)[0]!))
                        .font(.largeTitle)
               
                    HStack
                    {
                        SubcountView(branch: "income", amount: getMoneyDict(Bills: modelData.bills)[1]!)
                            .frame(width: 170, height: 130)
                            .background((Color.gray).opacity(0.1)).cornerRadius(10)
                        SubcountView(branch: "expense", amount: getMoneyDict(Bills: modelData.bills)[2]!)
                            .frame(width: 170, height: 130)
                            .background((Color.gray).opacity(0.1)).cornerRadius(10)
                    }
                
                    NavigationLink(destination:AddBillView()){
                        Label("Add",systemImage: "plus.app")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .frame(width: 120, height: 45)
                                        .background(Color.blue)
                                        .cornerRadius(20)
                    }.padding()
                   
            
                PureListWithoutNavigation(state: "all")
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
