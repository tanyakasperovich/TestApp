//
//  ContentView.swift
//  TestApp
//
//  Created by Татьяна Касперович on 29.05.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        ZStack {
            if !profileViewModel.showSignInView {
                MainScreen()
            }
        }
        .onAppear {
            self.profileViewModel.showSignInView = true
           // self.profileViewModel.showSignInView = profileViewModel.isLogin == false
        }
        .fullScreenCover(isPresented: $profileViewModel.showSignInView) {
            NavigationStack {
                if profileViewModel.users.isEmpty {
                    RegistrationScreen()
                } else {
                    UsersListScreen()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ProfileViewModel())
}
