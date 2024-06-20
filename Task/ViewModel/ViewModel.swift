//
//  ViewModel.swift
//  Task
//
//  Created by Алексей Попов on 20.06.2024.
//

import Foundation

final class ViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var tasks: [TaskModel] = []
    @Published var newTask = ""

    // MARK: Methods
    func addTask(task: String) {
        let newTask = TaskModel(title: task)
        tasks.append(newTask)
    }
}
