//
//  ProfileView.swift
//  ToDoList
//
//  Created by Jad Rammal on 23/08/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile ...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        //Info: Name, email, member since
        VStack (alignment: .leading){
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))"
                )
            }
        }
        .padding()
                        
        //Sign out
        Button ("Log Out") {
            viewModel.logout()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
