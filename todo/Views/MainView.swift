//
//  ContentView.swift
//  todo
//
//  Created by iMac-9 on 12/11/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.inSignedIn, !viewModel.currentUserId.isEmpty{
            accountView
        }else{
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View{
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
