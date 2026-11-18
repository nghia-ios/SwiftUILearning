
import SwiftUI

struct ContentView: View {

    @State private var todos = [

        TodoItem(
            title: "Học Swift Ok",
            description: "Học biến, hằng và hàm trong Swift",
            isCompleted: false,
            priority: .high
        ),

        TodoItem(
            title: "Học SwiftUI",
            description: "Học NavigationStack và View",
            isCompleted: false,
            priority: .medium
        ),

        TodoItem(
            title: "Làm ứng dụng ToDoList",
            description: "Xây dựng ứng dụng quản lý công việc",
            isCompleted: true,
            priority: .low
        )
    ]

    // MARK: - Xóa công việc

    private func deleteTodo(id: UUID) {
        todos.removeAll { $0.id == id }
    }

    var body: some View {

        NavigationStack {

            List {

                ForEach($todos) { $todo in

                    NavigationLink {

                        TodoDetailView(
                            todo: $todo,
                            onDelete: {
                                deleteTodo(id: todo.id)
                            }
                        )

                    } label: {

                        VStack(alignment: .leading, spacing: 8) {

                            Text(todo.title)
                                .font(.headline)

                            Text(todo.description)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)

                            HStack {

                                Text("Ưu tiên: \(todo.priority.rawValue)")
                                    .foregroundStyle(todo.priority.color)

                                Spacer()

                                if todo.isCompleted {

                                    Label(
                                        "Hoàn thành",
                                        systemImage: "checkmark.circle.fill"
                                    )
                                    .foregroundStyle(.green)

                                } else {

                                    Label(
                                        "Chưa hoàn thành",
                                        systemImage: "circle"
                                    )
                                    .foregroundStyle(.orange)
                                }
                            }
                            .font(.caption)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .onDelete { indexSet in
                    todos.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("ToDoList")
        }
    }
}
