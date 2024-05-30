//
//  MainScreen.swift
//  TestApp
//
//  Created by Татьяна Касперович on 29.05.24.
//

import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel

    var body: some View {
        List {            
            Button("Log out") {
                profileViewModel.signOut()
            }
            
            Button(role: .destructive) {
                profileViewModel.showingAlert = true
            } label: {
                Text("Delete account")
            }
            .alert(isPresented: $profileViewModel.showingAlert) {
                Alert(title: Text("Удалить аккаунт"),
                      message: Text("Вы уверены что хотите удалить ваш аккаунт навсегда?"),
                      primaryButton: .destructive(Text("Удалить")) {
                    profileViewModel.deleteAccount()
                },
                      secondaryButton: .cancel()
                )
            }
        }
    }
}

#Preview {
    MainScreen()
}
