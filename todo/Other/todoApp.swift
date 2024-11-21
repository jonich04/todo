//
//  todoApp.swift
//  todo
//
//  Created by iMac-9 on 12/11/24.
//
import FirebaseCore
import SwiftUI
  
@main
struct todoApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
