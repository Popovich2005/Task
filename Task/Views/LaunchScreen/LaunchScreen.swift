//
//  LaunchScreen.swift
//  Task
//
//  Created by Алексей Попов on 26.06.2024.
//

import SwiftUI

struct LaunchScreen: View {
    
    // MARK: - Properties
    @Binding var isPresented: Bool
    @State var progress: CGFloat = 0.0
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    
    // MARK: - Body
    var body: some View {
        ZStack {
            
            // MARK: Background
            BackgroundView()
            
            ZStack {
                
                // MARK: Logo
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color.tDPrimary.opacity(0.25))
                    .frame(width: 100, height: 100)
                Image(systemName: "checkmark")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.tDPrimary)
                
                // MARK: - Progress View
                VStack {
                    Spacer()
                    CustomProgressView(initialProgress: $progress, color: Color.tDPrimary)
                        .frame(height: 8)
                        .onReceive([self.progress].publisher) { _ in
                            if self.progress >= 1.0 {
                                self.isPresented = false
                            }
                        }
                        .padding(.bottom, 30)
                        .padding(.horizontal, 40)
                }
            }
            .onAppear {
                self.startTimer()
            }
        }
    }
    
    // MARK: - Metod
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { time in
            self.progress += 0.05
        }
    }
}

// MARK: - Preview
#Preview {
    LaunchScreen(isPresented: .constant(true))
}
