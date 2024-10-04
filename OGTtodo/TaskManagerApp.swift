//
//  TaskManagerApp.swift
//  OGTtodo
//
//  Created by Orkhan Gojayev on 10/4/24.
//

import SwiftUI
import SwiftData

@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
