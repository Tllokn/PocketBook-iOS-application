//
//  addBill.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/13.
//

import SwiftUI

struct AddBillView: View {
    @State private var newBill=Bill()
    
    var branchs = ["income","expense"]
    var categories = ["food","shopping","transportation","entertainment","education","rent","medical","salary","investment","allowance"]
    
    var methods = ["Credit Card","Cash","Apple Pay","Alipay","PayPal","Check"]
    
    let skyBlue = Color(red: 0.1, green: 0.6, blue: 0.9)
    
    var body: some View {
            VStack(alignment: .center){
                
                Text("Add New Bill")
                    .font(.largeTitle)
                
            Group{
                HStack{
                    Text("Branch:")
                        .font(.title3)
                        Spacer()
                        
                    Picker("Choose Branch:",selection: $newBill.branch)
                    {
                        ForEach(branchs,id: \.self)
                        {
                            Text($0).font(.title)
                        }
                    }
                    .pickerStyle(.segmented)
                }.padding()
                
                
                HStack{
                        //citehttps://www.hackingwithswift.com/quick-start/swiftui/how-to-format-a-textfield-for-numbers
                        Text("Amount:")
                            .font(.title3)
                          Spacer()
                        TextField("Enter Amount", value:$newBill.amount,format: .number)
                            .keyboardType(.decimalPad)
                            .frame(height: 40)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                            
                        }.padding()
                
                HStack{
                    Text("Category:")
                        .font(.title3)
                        Spacer()
    
                    //I tried every method however I cannot modify the font, its just so ugly
                    Picker(selection: $newBill.category,label: Text(""))
                    {
                        ForEach(categories,id: \.self)
                        {
                            cate in
                                HStack {
                                    Text(cate)
                                    .font(.title2)
                                }
                        }
                    }
//                    .pickerStyle(WheelPickerStyle())
                }.padding()
                
                
                HStack{
                    Text("Date:")
                        .font(.title3)
                        Spacer()
    
                    DatePicker(selection: $newBill.date, in: ...Date(), displayedComponents: .date){}
                }.padding()
                
                
                HStack{
                    Text("Method:")
                        .font(.title3)
                        Spacer()
                    Picker(selection: $newBill.method,label: Text(""))
                    {
                        ForEach(methods,id: \.self)
                        {
                            method in
                                HStack {
                                    Text(method)
                                    .font(.title2)
                                }
                        }
                    }
                }.padding()
                
                Text("Description:")
                    .font(.title3)
                TextField("Enter Description", text: $newBill.description)
                        .frame(height: 40)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 4)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                        .padding()
            }
           
                Spacer()
                
                NavigationLink(destination:ContentView()){
                        Label("Submit",systemImage: "shift")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 120, height: 45)
                                .background(skyBlue.opacity(1.0))
                                .cornerRadius(7)
                }.simultaneousGesture(TapGesture().onEnded{
                    
                    BillLoader.write(newBill: newBill)
                    
                })
        }
        
    }

}


struct AddBillView_Previews: PreviewProvider {
    static var previews: some View {
        AddBillView()
            .environmentObject(ModelData())
    }
}
