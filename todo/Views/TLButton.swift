//
//  TLButton.swift
//  todo
//
//  Created by iMac-9 on 14/11/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: ()->Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
    }


#Preview {
    TLButton(title: "value", background: .pink){
        //action
    }
}
