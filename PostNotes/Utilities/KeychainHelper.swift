//
//  KeychainHelper.swift
//  PostNotes
//
//  Created by Yuri Petrosyan on 25/04/2024.
//

import Foundation
import Security

func saveAPIKey(key: String, forKey: String) -> Bool {
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: forKey,
        kSecValueData as String: key.data(using: .utf8) ?? Data()
    ]
    return SecItemAdd(query as CFDictionary, nil) == errSecSuccess
}

func getAPIKey(forKey: String) -> String? {
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: forKey,
        kSecMatchLimit as String: kSecMatchLimitOne,
        kSecReturnData as String: true
    ]

    var result: AnyObject?
    let status = SecItemCopyMatching(query as CFDictionary, &result)

    guard status == errSecSuccess,
          let data = result as? Data,
          let key = String(data: data, encoding: .utf8) else {
      return nil
  }
  return key
}


func loadAndSaveAPIKey() {
    guard let path = Bundle.main.path(forResource: "api_keys", ofType: "plist"), // Adjust if using .env
          let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
          let dict = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: String],
          let apiKey = dict["api_key"] else {
          print("Error loading API key")
          return
  }

  let didSave = saveAPIKey(key: apiKey, forKey: "my_api_key")
  if didSave {
      //  At this point, it's safe to delete your config file. Do so securely.
      print("API key saved to Keychain")
  } else {
      print("Error saving API key to Keychain")
  }
}
