//
//  Model.swift
//  Task
//
//  Created by Алексей Попов on 20.06.2024.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}
