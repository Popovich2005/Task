//
//  CustomButton.swift
//  Task
//
//  Created by Алексей Попов on 21.06.2024.
//

import SwiftUI

struct CustomButton: View {
    
    // MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    @Environment (\.dismiss) private var dismiss
    let titleButton: String
    let action: () -> ()
    
    // MARK: - Body
    var body: some View {
        Button {
            action()
            dismiss()
        } label: {
            Text(titleButton)
                .font(.headline)
                .padding()
                .foregroundColor(Color.tDBackground1)
                .frame(maxWidth: .infinity)
                .background(Color.tDAccent)
                .cornerRadius(10)
        }
    }
}

// MARK: - Preview
#Preview {
    CustomButton(titleButton: "Добавить задачу") {}
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
