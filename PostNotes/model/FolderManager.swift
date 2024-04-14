// FoldersManager.swift

import Foundation

class FoldersManager {
    static let shared = FoldersManager()
    
    // UserDefaults key for storing folder names
    private let foldersKey = "Folders"
    
    // Array to store folder names
    @Published var folders: [String] = []
    
    private init() {
        // Load folders from UserDefaults
        if let savedFolders = UserDefaults.standard.stringArray(forKey: foldersKey) {
            folders = savedFolders
        } else {
            // Initialize with default folders if no folders are saved
            folders = ["Important", "Favorites", "Archived", "Secondary"]
            saveFolders()
        }
    }
    
    // Add a new folder (excluding default folders)
    func addFolder(name: String) {
        if !folders.contains(name) {
            folders.append(name)
            saveFolders()
        }
    }
    
    // Remove a custom folder (excluding default folders)
    func removeFolder(at index: Int) {
        if index >= 4 && index < folders.count {
            folders.remove(at: index)
            saveFolders()
        }
    }
    
    // Save folders to UserDefaults
    private func saveFolders() {
        UserDefaults.standard.set(folders, forKey: foldersKey)
    }
}
