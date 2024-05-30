//
//  TestAppApp.swift
//  TestApp
//
//  Created by Татьяна Касперович on 29.05.24.
//

import SwiftUI

@main
struct TestAppApp: App {
    @State private var showSplashScreen: Bool = true
    @StateObject var profileViewModel = ProfileViewModel()

    var body: some Scene {
        WindowGroup {
            if showSplashScreen {
                SplashScreen(showSplashScreen: $showSplashScreen)
                    .transition(.opacity)
            } else {
                ContentView()
                    .environmentObject(profileViewModel)
            }
        }
    }
}
