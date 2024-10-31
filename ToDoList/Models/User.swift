//
//  User.swift
//  ToDoList
//
//  Created by Jad Rammal on 23/08/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
