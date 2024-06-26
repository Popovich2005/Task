//
//  ContainerView.swift
//  Task
//
//  Created by Алексей Попов on 26.06.2024.
//

import SwiftUI

struct ContainerView: View {
    
    // MARK: - Properties
    @State private var isLaunchScreenViewPresented = true
    
    // MARK: - Body
    var body: some View {
        if !isLaunchScreenViewPresented {
            ContentView()
        } else {
            LaunchScreen(isPresented: $isLaunchScreenViewPresented)
        }
    }
}

#Preview {
    ContainerView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
