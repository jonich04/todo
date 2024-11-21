//
//  LoginView.swift
//  todo
//
//  Created by iMac-9 on 14/11/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                HeaderView( title: "To Do list",subtitle: "Get things done",
                            background: .pink)
                
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("email",text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("password",text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Вход", background: .blue){
                        viewModel.login()
                    }
                    .padding()
                    
                }
                VStack{
                    Text("Нет аккаунта")
                    NavigationLink("Регистрация",destination:RegisterView())
                }
                Spacer()
            }
        }
    }
}
    #Preview {
        LoginView()
    }

