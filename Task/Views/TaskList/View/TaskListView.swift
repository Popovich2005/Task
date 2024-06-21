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
                    List {
                        ForEach(vm.tasks) { task in
                            TaskRow(action: {
                                vm.isCompletedTask(task: task)
                            }, model: task)
                            .onTapGesture {
                                isEditViewPresented = true
                            }
                        }
                        .onDelete(perform: vm.deleteTask)
                        
                        // MARK: Edit View
                        .sheet(isPresented: $isEditViewPresented, content: {
                            EditTaskView()
                        })
                    }
                    .listStyle(.plain)
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
