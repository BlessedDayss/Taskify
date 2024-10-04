//
//  TaskDetailView.swift
//  OGTtodo
//
//  Created by Orkhan Gojayev on 10/4/24.
//

import SwiftUI

struct TaskDetailView: View {
    @ObservedObject var task: Task
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    var body: some View {
        Form {
            Section(header: Text("Название")) {
                TextField("Введите название", text: $task.title)
            }
            Section(header: Text("Описание")) {
                TextEditor(text: $task.detail)
                    .frame(height: 150)
            }
            Section {
                Toggle("Завершено", isOn: $task.isCompleted)
            }
        }
        .navigationTitle("Детали задачи")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: deleteTask) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            }
        }
    }

    private func deleteTask() {
        context.delete(task)
        dismiss()
    }
}
    