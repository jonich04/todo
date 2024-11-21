//
//  ProfileView.swift
//  todo
//
//  Created by iMac-9 on 12/11/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user:user)
                }else {
                    Text("loading profile..")
                }
                }
                
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User)-> some View{
        //аватарка
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125,height: 125)
            .padding()
        //информации пользователя
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack{
                Text("Email:")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack{
                Text("Member Since")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()

        Spacer() 
    }
}

#Preview {
    ProfileView()
}
