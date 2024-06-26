//
//  EditTaskView.swift
//  Task
//
//  Created by Алексей Попов on 21.06.2024.
//

import SwiftUI

struct EditTaskView: View {
    
    // MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    @Environment (\.dismiss) private var dismiss
    var task: TaskModel
    
    var body: some View {
        VStack {
            
            HStack(alignment: .center) {
                
                Text("Редактировать Задачу")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .topLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Отмена")
                                .frame(width: 80)
                                .foregroundColor(Color.tDAccent)
                        }
                    }
                    .padding(.vertical)
                
            }
            
            CustomTextField(placeholder: "Редактирование Задачи")
            CustomButton(titleButton: "Сохранить") {
                vm.updateTask(id: task.id, title: vm.newTask)
            }
            
            Spacer()
            
        }
        .padding()
        .background(
            BackgroundView()
        )
        .onAppear() {
            vm.newTask = task.title
        }
    }
}

#Preview {
    EditTaskView(task: TaskModel(title: "Task1"))
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
