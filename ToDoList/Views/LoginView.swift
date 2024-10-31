//
//  LoginView.swift
//  ToDoList
//
//  Created by Jad Rammal on 23/08/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(
                    title: "To Do List",
                    subtitle: "Get things done",
                    angle: 15,
                    background: .pink
                )
                
                //LoginForm
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Login", background: .blue, action: {
                        viewModel.login()
                    })
                }
                .offset(y: -50)
                
                //Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink(
                        "Create An Account",
                        destination: RegisterView()
                    )
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}

