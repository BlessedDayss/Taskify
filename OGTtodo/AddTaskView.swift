//
//  AddTaskView.swift
//  OGTtodo
//
//  Created by Orkhan Gojayev on 10/4/24.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @State private var title: String = ""
    @State private var detail: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Название")) {
                    TextField("Введите название", text: $title)
                }
                Section(header: Text("Описание")) {
                    TextEditor(text: $detail)
                        .frame(height: 150)
                }
            }
            .navigationTitle("Новая задача")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Отмена") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Сохранить") {
                        addTask()
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }

    private func addTask() {
        let newTask = Task(title: title, detail: detail)
        context.insert(newTask)
    }
}
