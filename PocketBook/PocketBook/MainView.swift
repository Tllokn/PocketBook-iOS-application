//
//  MianView.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/16.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                       .tabItem {
                           Label("Menu", systemImage: "list.dash")
                       }
            
            BillList(state: "all")
                        .tabItem {
                            Label("Bills",systemImage: "note.text")
                        }

            AllSubTotalView(branch: "income")
                       .tabItem {
                           Label("Income", systemImage: "plus.app")
                       }
            
            AllSubTotalView(branch: "expense")
                       .tabItem {
                           Label("Expense", systemImage: "minus.square")
                       }
            
               }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ModelData())
    }
}
