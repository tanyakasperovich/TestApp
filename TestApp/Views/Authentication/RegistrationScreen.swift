//
//  RegistrationScreen.swift
//  TestApp
//
//  Created by Татьяна Касперович on 29.05.24.
//

import SwiftUI

struct RegistrationScreen: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            
            TextField("Email...", text: $profileViewModel.email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textCase(.lowercase)
                .textInputAutocapitalization(.none)
                .padding()
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            SecureField("Password...", text: $profileViewModel.password)
                .padding()
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            
            Button {
                profileViewModel.signUp()
            } label: {
                Text("Зарегистрироваться")
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
        .navigationTitle("Регистрация")
        .alert(isPresented: $profileViewModel.showingAlert) {
            Alert(title: Text("Ошибка"), message: Text(profileViewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    var disableForm: Bool {
        profileViewModel.email.isEmpty || profileViewModel.password.isEmpty
    }
}

#Preview {
    RegistrationScreen()
        .environmentObject(ProfileViewModel())
}
