//
//  TaskRow.swift
//  Task
//
//  Created by Алексей Попов on 21.06.2024.
//

import SwiftUI

struct TaskRow: View {
    
    // MARK: - Properties
    let action: () -> ()
    
    var model: TaskModel
    
    // MARK: - Body
    var body: some View {
        HStack {
            
            // MARK: Title
            model.isCompleted 
            ? Text(model.title).strikethrough().foregroundColor(Color.tDPrimary.opacity(0.5))
            : Text(model.title)

            Spacer()
            
            // MARK: Task Completion Toggle
            Button {
                action()
            } label: {
                Image(systemName: model.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.tDAccent)
            }
            .buttonStyle(.borderless)
        }
        .font(.headline)
        .padding()
        .background(model.isCompleted ? Color.tDPrimary.opacity(0.15) : Color.tDPrimary.opacity(0.3))
        .cornerRadius(10)
        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .padding(.vertical, 6)
    }
}

#Preview {
    List {
        TaskRow(action: {}, model: TaskModel(title: "Task1", isCompleted: true))
        TaskRow(action: {}, model: TaskModel(title: "Task2", isCompleted: false))
    }
    .listStyle(.plain)
    .preferredColorScheme(.dark)

}
