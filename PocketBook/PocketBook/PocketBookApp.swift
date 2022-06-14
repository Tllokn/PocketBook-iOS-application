//
//  PocketBookApp.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/13.
//

import SwiftUI

@main
struct PocketBookApp: App {
    @StateObject private var modelData=ModelData()
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .environmentObject(modelData)
        }
    }
}
