import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TaskListView()
                .navigationTitle("Задачи")
        }
    }
}
    