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
            LinearGradient(
                colors: [Color.tDBackground1, Color.tDBackground2],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                // MARK: TextField
                TextField("Введите новую задачу", text: $vm.newTask)
                    .font(.headline)
                    .padding()
                    .background(Color.tDPrimary.opacity(0.2))
                    .cornerRadius(10)
                
                // MARK: Add Task Button
                Button {
                    vm.addTask(task: vm.newTask)
                    dismiss()
                } label: {
                    Text("Добавить задачу")
                        .font(.headline)
                        .padding()
                        .foregroundColor(Color.tDBackground1)
                        .frame(maxWidth: .infinity)
                        .background(Color.tDAccent)
                        .cornerRadius(10)
                }
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
