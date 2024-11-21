//
//  MainViewViewModel.swift
//  todo
//
//  Created by iMac-9 on 12/11/24.
//
import FirebaseAuth
import Foundation
class MainViewViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
         DispatchQueue.main.async {
            self?.currentUserId = user?.uid ?? ""
        }
      }
    }
    public var inSignedIn: Bool{
        return Auth.auth().currentUser != nil
        
    }
}
