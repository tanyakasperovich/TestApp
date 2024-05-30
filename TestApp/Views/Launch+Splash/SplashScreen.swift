//
//  SplashScreen.swift
//  TestApp
//
//  Created by Татьяна Касперович on 29.05.24.
//

import SwiftUI

struct SplashScreen: View {
    @Binding var showSplashScreen: Bool
    
    var body: some View {
        ZStack {
            Image("LaunchScreenImage")
                .resizable()
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.showSplashScreen = false
            }
        }
    }
}

#Preview {
    SplashScreen(showSplashScreen: .constant(false))
}
