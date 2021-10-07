//
//  LoginView.swift
//  Pokedex
//
//  Created by user206981 on 10/7/21.
//

import SwiftUI

struct LoginView: View {
    @State private var username = String()
    
    private let localStorage: LocalStorage = .init()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, \(username.isEmpty ? "you" : username)!")
                .padding()
            TextField("Enter your username", text: $username)
                .padding()
            Button("Save username") {
                localStorage.storeUsername(username)
                print("Saved \(username)")
            }.padding()
            Spacer()
        }.onAppear {
            username = localStorage.fetchUsername()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
