//
//  RegisterView.swift
//  todo
//
//  Created by iMac-9 on 12/11/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            HeaderView( title: "Register",subtitle: "Start organizing todos",
                        background: .orange)
            Form{
                TextField("ФИО",text:$viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("email",text:$viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("password",text:$viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Регистрация", background: .yellow){
                    viewModel.register()
                }
                .padding()
            }
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
