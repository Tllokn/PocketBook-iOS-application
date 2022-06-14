//
//  SplashScreen.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/16.
//

import SwiftUI

struct SplashScreen: View {
        @State var isActive:Bool = false
        
        var body: some View {
            VStack {
                if self.isActive {
                    MainView()
                } else {
                    VStack{
                                Image("Splash")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                
                                Text("My Pocket Book")
                                    .font(.largeTitle)
                            }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
