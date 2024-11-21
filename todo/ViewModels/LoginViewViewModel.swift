//
//  LoginViewViewModel.swift
//  todo
//
//  Created by iMac-9 on 12/11/24.
//
import FirebaseAuth
import Foundation
class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {}
    func login() {
        guard validate()else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    private func validate()-> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Вы не заполинили поля"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Email введен не верно, повторите заново"
            return false
        }
        return true
    }
}
