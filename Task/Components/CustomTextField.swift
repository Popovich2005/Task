//
//  CustomTextField.swift
//  Task
//
//  Created by Алексей Попов on 21.06.2024.
//

import SwiftUI

struct CustomTextField: View {
    
    // MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    let placeholder: String
    
    // MARK: - Body
    var body: some View {
        TextField(placeholder, text: $vm.newTask)
            .font(.headline)
            .padding()
            .background(Color.tDPrimary.opacity(0.2))
            .cornerRadius(10)
    }
}

// MARK: - Preview
#Preview {
    CustomTextField(placeholder: "Введите новую задачу")
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
