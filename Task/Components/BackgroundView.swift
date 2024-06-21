//
//  BackgroundView.swift
//  Task
//
//  Created by Алексей Попов on 21.06.2024.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [Color.tDBackground1, Color.tDBackground2],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
