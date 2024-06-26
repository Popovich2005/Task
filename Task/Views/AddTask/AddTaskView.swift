//
//  AddTaskView.swift
//  Task
//
//  Created by Алексей Попов on 20.06.2024.
//

import SwiftUI

struct AddTaskView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var vm: ViewModel
    @Environment (\.dismiss) private var dismiss

    
    var body: some View {
        ZStack {
            
            // MARK: Background
            BackgroundView()
            
            VStack {
                // MARK: TextField
                CustomTextField(placeholder: "Введите новую задачу")
                
                // MARK: Add Task Button
                CustomButton(titleButton: "Добавить задачу") {
                    vm.addTask(task: vm.newTask)
                }
                .disabled(vm.newTask.isEmpty)
                Spacer()
            }
            .padding()
        }
        
        // MARK: - Navigation Bar
        .navigationTitle("Добавить Задачу")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            
            // MARK: Back Button
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .foregroundColor(Color.tDAccent)
                }
            }
        }
        .onAppear {
            vm.newTask = ""
        }
    }
}

#Preview {
    NavigationView {
        AddTaskView()
            .environmentObject(ViewModel())
            .preferredColorScheme(.dark)
    }
}
