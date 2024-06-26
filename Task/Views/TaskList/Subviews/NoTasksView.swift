//
//  NoTasksView.swift
//  Task
//
//  Created by Алексей Попов on 24.06.2024.
//

import SwiftUI

struct NoTasksView: View {
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            Spacer()
            
            // MARK: Text
            Text("НЕТ ЗАДАЧ, ХОТИТЕ ДОБАВИТЬ?")
                .foregroundColor(Color.tDPrimary.opacity(0.5))
                .font(.title)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            // MARK: Button
            NavigationLink(destination: AddTaskView()) {
                ZStack {
                    Circle()
                        .frame(width: 100)
                        .foregroundColor(Color.tDPrimary.opacity(0.5))
                    
                    Image(systemName: "plus")
                        .foregroundColor(Color.tDBackground2)
                        .font(.largeTitle)
                }
            }
            .padding(.bottom)
        }
    }
}

// MARK: - Preview
#Preview {
    NoTasksView()
        .preferredColorScheme(.dark)
}
