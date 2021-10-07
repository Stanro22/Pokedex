//
//  Local Storage.swift
//  Pokedex
//
//  Created by user206981 on 10/7/21.
//

import KeychainAccess

struct LocalStorage {
    private let keychain = Keychain()
    private let usernameKeychainKey = "username"

    func fetchUsername() -> String {
        // Retrieve the username
        let storedUsername = try? keychain.get(usernameKeychainKey)
        return storedUsername ?? ""
    }

    func storeUsername(_ username: String) {
        // Only continue if we have a username to store
        guard username.isEmpty == false else {
            // Remove the current username if we overwrite it with an empty String
            try? keychain.remove(usernameKeychainKey)
            return
        }
        // Store the username
        try? keychain.set(username, key: usernameKeychainKey)
    }
}
