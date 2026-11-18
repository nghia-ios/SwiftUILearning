
import SwiftUI

// MARK: - Mức độ ưu tiên

enum TodoPriority: String, CaseIterable, Identifiable {

    case high = "Cao"
    case medium = "Trung bình"
    case low = "Thấp"

    var id: String {
        rawValue
    }

    var color: Color {
        switch self {
        case .high:
            return .red
        case .medium:
            return .orange
        case .low:
            return .green
        }
    }
}

// MARK: - Model công việc

struct TodoItem: Identifiable {

    var id = UUID()

    var title: String
    var description: String
    var isCompleted: Bool

    var priority: TodoPriority
}
