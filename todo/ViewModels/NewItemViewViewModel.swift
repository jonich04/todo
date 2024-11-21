//
//  NewItemViewViewModel.swift
//  todo
//
//  Created by iMac-9 on 12/11/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueData = Date()
    @Published var showAlert = false
    init() {
        
    }
    func save(){
        guard canSave else{
            return
        }
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueData.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueData >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
