//
//  TaskListView.swift
//  OGTtodo
//
//  Created by Orkhan Gojayev on 10/4/24.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    @Query(sort: \.createdAt, order: .reverse) var tasks: [Task]
    @Environment(\.modelContext) private var context

    var body: some View {
        List {
            ForEach(tasks) { task in
                NavigationLink(destination: TaskDetailView(task: task)) {
                    TaskRowView(task: task)
                }
            }
            .onDelete(perform: deleteTasks)
        }
        .listStyle(.insetGrouped)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddTaskView()) {
                    Image(systemName: "plus")
                }
            }
        }
    }

    private func deleteTasks(at offsets: IndexSet) {
        for index in offsets {
            context.delete(tasks[index])
        }
    }
}
