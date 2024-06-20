//
//  TaskListView.swift
//  Task
//
//  Created by Алексей Попов on 20.06.2024.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    //    MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                
                // MARK: Background
                LinearGradient(
                    colors: [Color.tDBackground1, Color.tDBackground2],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                VStack {
                    List {
                        ForEach(vm.tasks) { task in
                            Text(task.title)
                        }
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
