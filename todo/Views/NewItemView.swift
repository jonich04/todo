//
//  NewItemView.swift
//  todo
//
//  Created by iMac-9 on 12/11/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var  viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form{
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Data", selection: $viewModel.dueData)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "Save", background:.pink){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or never."))
                }
        }
    }
}
#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    } ))
}
