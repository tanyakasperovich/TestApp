//
//  AuthorizationScreen.swift
//  TestApp
//
//  Created by Татьяна Касперович on 29.05.24.
//

import SwiftUI

struct AuthorizationScreen: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    //var email: String
    @State var password: String = ""
    var user: UserEntity
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text(user.email ?? "")
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundStyle(.green)
            }
                .padding()
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            SecureField("Password...", text: $password)
                .padding()
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            Button {
                profileViewModel.signIn(email: user.email ?? "", password: password, currentUserPassword: user.password ?? "")
            } label: {
                Text("Авторизация")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(disableForm ? Color.secondary : Color.blue)
                    .cornerRadius(10)
            }
            .disabled(disableForm)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Авторизация")
        .alert(isPresented: $profileViewModel.showingAlert) {
            Alert(title: Text("Ошибка"), message: Text(profileViewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    var disableForm: Bool {
        password.isEmpty
    }
}

#Preview {
    AuthorizationScreen(user: UserEntity())
        .environmentObject(ProfileViewModel())
}
