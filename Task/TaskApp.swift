//
//  TaskApp.swift
//  Task
//
//  Created by Алексей Попов on 20.06.2024.
//

import SwiftUI

@main
struct TaskApp: App {
    
    // MARK: - Properties
    @AppStorage("isDarkMode") private var isDarkMode = true
    @StateObject var vm = ViewModel()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
