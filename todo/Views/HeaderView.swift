//
//  HeaderView.swift
//  todo
//
//  Created by iMac-9 on 12/11/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let background: Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
            VStack{
                Text(title)
                    .font(.system(size:50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size:30))
                    .foregroundColor(Color.white)
            }
        }
        .frame(width:UIScreen.main.bounds.width * 3,height: 300)
    }
}

#Preview {
    HeaderView(title: "Title",
               subtitle: "subtitle",
               background: .blue)
}
