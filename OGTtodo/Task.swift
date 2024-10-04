//
//  Task.swift
//  OGTtodo
//
//  Created by Orkhan Gojayev on 10/4/24.
//

import Foundation
import SwiftData

@Model
class Task {
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    var detail: String
    var isCompleted: Bool = false
    var createdAt: Date = Date()

    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
    }
}
