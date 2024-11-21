//
//  ToDoListItemViewViewModel.swift
//  todo
//
//  Created by iMac-9 on 12/11/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    func toogleIsDone(item: ToDoListItem){
        var ItemCopy = item
        ItemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(ItemCopy.id)
            .setData(ItemCopy.asDictionary())
    }
}
