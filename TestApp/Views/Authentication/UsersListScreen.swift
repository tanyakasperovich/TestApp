//
//  UsersListScreen.swift
//  TestApp
//
//  Created by Татьяна Касперович on 29.05.24.
//

import SwiftUI

struct UsersListScreen: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 10) {
                ForEach(profileViewModel.users, id: \.email) { user in
                    NavigationLink {
                        AuthorizationScreen(user: user)
                    } label: {
                            HStack {
                                Text(user.email ?? "")
                                    .foregroundStyle(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.blue)
                                    .bold()
                            }
                                .padding()
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                    }
                }
                
                
                NavigationLink {
                   RegistrationScreen()
                } label: {
                    Text("Зарегистрироваться")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
        }
    }
}

#Preview {
    UsersListScreen()
        .environmentObject(ProfileViewModel())
}
