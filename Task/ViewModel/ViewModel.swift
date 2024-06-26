//
//  ViewModel.swift
//  Task
//
//  Created by Алексей Попов on 20.06.2024.
//

import Foundation

final class ViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var newTask = ""
    @Published var selectedTask: TaskModel?
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveTask()
        }
    }
    
    let keyUD = "keyUD"
    
    /// Progress View Property
    var completionRate: Double {
        let totalTasks = tasks.count
        let completionTasks = tasks.filter { $0.isCompleted }.count
        return totalTasks > 0 ? Double(completionTasks) / Double(totalTasks) : 0
    }
    
    // MARK: Initializer
    init() {
        getTasks()
    }

    // MARK: - Create
    func addTask(task: String) {
        let newTask = TaskModel(title: task)
        tasks.append(newTask)
    }
    
    // MARK: - Read
    func getTasks() {
        guard let data = UserDefaults.standard.data(forKey: keyUD) else { return }
        do {
            let decodeTasks = try JSONDecoder().decode([TaskModel].self, from: data)
            DispatchQueue.main.async {
                self.tasks = decodeTasks
            }
        } catch {
            print("Error loading task: \(error)")
        }
    }
    
    // MARK: - Upate
    func saveTask() {
        do {
            let encodeTask = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(encodeTask, forKey: keyUD)
        } catch {
            print("Error saving task: \(error)")
        }
    }
    
    func isCompletedTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func updateTask(id: UUID, title: String) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].title = title
        }
    }
    
    // MARK: - Delete
    func deleteTask(task: IndexSet) {
        tasks.remove(atOffsets: task)
    }
}
