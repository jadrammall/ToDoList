//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Jad Rammal on 23/08/2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel =  ToDoListItemViewViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970:item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ToDoListItemView( item: .init(
        id: "123",
        title: "Go to gym",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: true)
    )
}
