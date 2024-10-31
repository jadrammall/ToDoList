//
//  TLButton.swift
//  ToDoList
//
//  Created by Jad Rammal on 23/08/2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            //Action
            action()
        } label : {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text (title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(title: "Login", background: .blue, action: {
        
    })
}
