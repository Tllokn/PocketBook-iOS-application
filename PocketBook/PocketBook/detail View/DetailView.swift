//
//  DetailView.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/12.
//

import SwiftUI

struct DetailView: View {
    var bill: Bill
    
    let darkRed = Color(red: 0.85, green: 0.2, blue: 0.3)
    let darkBlue = Color(red: 0.098, green: 0.098, blue: 0.43)
    let skyBlue = Color(red: 0.5, green: 0.6, blue: 0.9)
    let darkPurple=Color(red: 160/255.0, green: 102/255.0, blue: 211/255.0)
    let red = Color(red: 1.0, green: 0.0, blue: 0.0)
    
    var body: some View {
        
        let bgc=(bill.branch=="income" ? skyBlue : red)
        
        NavigationView{
            VStack(alignment: .center){
                AmountSquareView(branch: bill.branch, amount: bill.amount)
                    .frame(width: UIScreen.main.bounds.size.width-20, height: 100)
                    .background((bgc).opacity(0.1)).cornerRadius(10)
                
                Divider()
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Category:")
                            .font(.title3)
                        Spacer()
                        Text(bill.category)
                            .font(.title3)
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Date:")
                            .font(.title3)
                        Spacer()
                        Text(formatDate(date:bill.date))
                            .font(.title3)
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Method:")
                            .font(.title3)
                        Spacer()
                        Text(bill.method)
                            .font(.title3)
                    }
                    
                    Divider()
                    
                    Text("Description:")
                        .font(.title3)
                    
                    Divider()
                    
                    Text(bill.description)
                    
                }
                
                Spacer()
                
                //            HStack(spacing: 0.0){
                //
                //                NavigationLink(destination:AddBillView()){
                //                Label("Edit",systemImage: "square.and.pencil")
                //                        .font(.title2)
                //                        .foregroundColor(.white)
                //                        .frame(width: 120, height: 45)
                //                        .background(darkBlue.opacity(1.0))
                //                        .cornerRadius(7)
                //                }
                //
                //                Spacer()
                //
                NavigationLink(destination:BillList(state: "all")){
                        Label("Delete",systemImage: "clear")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .frame(width: 120, height: 45)
                                        .background(darkRed.opacity(1.0))
                                        .cornerRadius(7)
                                }.simultaneousGesture(TapGesture().onEnded{
                                    BillLoader.delete(deleteBill: bill)
                                    
                                })
                //            }
                //            .padding(.horizontal, 50.0)
                
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(bill: ModelData().bills[0])
    }
}
