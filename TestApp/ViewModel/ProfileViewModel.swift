//
//  ProfileViewModel.swift
//  TestApp
//
//  Created by Татьяна Касперович on 29.05.24.
//

import SwiftUI
import CoreData

class ProfileViewModel: ObservableObject {
    let manager = CoreDataManager.instance
   // @AppStorage("isLogin") var isLogin: Bool = false
    @Published var users: [UserEntity] = []
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var showSignInView: Bool = false
    
    // Alert...
    @Published var showingAlert = false
    @Published var alertMessage = ""
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        let request = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        do {
            users = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func addUser(email: String, password: String) {
        let newUser = UserEntity(context: manager.context)
        newUser.email = email
        newUser.password = password
        newUser.dateCreate = Date()
        save()
    }
    
//    func deleteUser(indexSet: IndexSet) {
//        guard let index = indexSet.first else { return }
//        let entity = users[index]
//        manager.context.delete(entity)
//        save()
//    }
    func deleteUser() {
        let user = users[0]
        manager.context.delete(user)
        save()
    }
    
    func save() {
        manager.save()
    }
    
    func signUp() {
        if !emailIsValid(email) {
            alertMessage = "Некорректный адрес электронной почты."
            showingAlert = true
            return
        } else if password.count < 8 {
            alertMessage = "Пароль должен содержать не менее 8 символов."
            showingAlert = true
            return
        } else {
            self.addUser(email: email, password: password)
           // self.isLogin = true
            self.showingAlert = false
            self.alertMessage = ""
            self.email = ""
            self.password = ""
            self.showSignInView = false
        }
        
    }
    
    func signIn(email: String, password: String, currentUserPassword: String) {
       if currentUserPassword != password {
            alertMessage = "Неверный пароль."
            showingAlert = true
        } else {
           // self.isLogin = true
            self.showingAlert = false
            self.alertMessage = ""
            self.showSignInView = false
        }
    }
    
    func deleteAccount() {
        self.deleteUser()
        self.getUsers()
        self.showingAlert = false
        self.email = ""
        self.password = ""
        //self.isLogin = false
        self.showSignInView = true
    }
    
    func signOut() {
        //self.isLogin = false
        self.getUsers()
        self.email = ""
        self.password = ""
        self.showSignInView = true
    }
    
    func emailIsValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
