//
//  TaskRowView.swift
//  OGTtodo
//
//  Created by Orkhan Gojayev on 10/4/24.
//

import SwiftUI

struct TaskRowView: View {
    @ObservedObject var task: Task
    @Environment(\.modelContext) private var context

    var body: some View {
        HStack {
            Button(action: toggleCompletion) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
            .buttonStyle(PlainButtonStyle())

            VStack(alignment: .leading) {
                Text(task.title)
                    .strikethrough(task.isCompleted, color: .gray)
                    .foregroundColor(task.isCompleted ? .gray : .primary)
                    .font(.headline)
                Text(task.detail)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }

    private func toggleCompletion() {
        task.isCompleted.toggle()
    }
}
