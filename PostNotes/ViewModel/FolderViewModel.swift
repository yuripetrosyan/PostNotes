// FoldersManager.swift

import Foundation

class FoldersViewModel: ObservableObject {
    static let shared = FoldersViewModel()
    
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
            folders = ["Recent", "Favorites", "Archived", "Secondary"]
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
    func removeFolder(name: String) {
        let defaultFolders = ["Important", "Favorites", "Archived", "Secondary"]
        if !defaultFolders.contains(name), let index = folders.firstIndex(of: name) {
            folders.remove(at: index)
            saveFolders()
        }
    }

    
    // Save folders to UserDefaults
    private func saveFolders() {
        UserDefaults.standard.set(folders, forKey: foldersKey)
    }
}
