//
//  TaskListView.swift
//  Task
//
//  Created by Алексей Попов on 20.06.2024.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var vm: ViewModel
    @State private var isEditViewPresented = false
    
    //    MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                
                // MARK: Background
                BackgroundView()
                VStack {
                    
                    if vm.tasks.isEmpty {
                        
                        // MARK: - Empty List
                        NoTasksView()
                    } else {
                        
                        // MARK: List Of Tasks
                        List {
                            ForEach(vm.tasks) { task in
                                TaskRow(action: {
                                    vm.isCompletedTask(task: task)
                                }, model: task)
                                .onTapGesture {
                                    vm.selectedTask = task
                                    isEditViewPresented = true
                                }
                            }
                            .onDelete(perform: vm.deleteTask)
                            
                            // MARK: Edit View
                            .sheet(isPresented: $isEditViewPresented, content: {
                                if let taskToEdit = vm.selectedTask {
                                    EditTaskView(task: taskToEdit)
                                }
                            })
                        }
                        .listStyle(.plain)
                        
                        // MARK: Progress View
                        ProgressView("Выполненные Задачи", value: vm.completionRate)
                            .progressViewStyle(LinearProgressViewStyle())
                            .accentColor(Color.tDPrimary)
                            .padding()
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
            }
            
            // MARK: - Navigation Bar
            .navigationTitle("Список Дел")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddTaskView()) {
                        Image(systemName: "plus")
                            .foregroundColor(Color.tDPrimary)
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    TaskListView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}


