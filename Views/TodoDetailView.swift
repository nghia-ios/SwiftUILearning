
import SwiftUI

struct TodoDetailView: View {

    // Dữ liệu gốc từ màn hình danh sách
    @Binding var todo: TodoItem

    // Bản chỉnh sửa tạm thời
    @State private var editedTodo: TodoItem

    // Hàm xóa do màn hình cha truyền vào
    var onDelete: () -> Void

    @Environment(\.dismiss) private var dismiss

    // MARK: - Khởi tạo

    init(
        todo: Binding<TodoItem>,
        onDelete: @escaping () -> Void
    ) {
        self._todo = todo
        self._editedTodo = State(
            initialValue: todo.wrappedValue
        )
        self.onDelete = onDelete
    }

    var body: some View {

        VStack(spacing: 20) {

            Image(systemName: "list.clipboard")
                .font(.system(size: 60))
                .foregroundStyle(.blue)

            Text("Chi tiết công việc")
                .font(.largeTitle)
                .bold()

            // Tên công việc
            TextField(
                "Tên công việc",
                text: $editedTodo.title
            )
            .textFieldStyle(.roundedBorder)

            // Mô tả
            TextField(
                "Mô tả công việc",
                text: $editedTodo.description
            )
            .textFieldStyle(.roundedBorder)

            // Mức độ ưu tiên
            VStack(alignment: .leading, spacing: 10) {

                Text("Mức độ ưu tiên")
                    .font(.headline)

                Picker(
                    "Mức độ ưu tiên",
                    selection: $editedTodo.priority
                ) {

                    ForEach(TodoPriority.allCases) { priority in

                        Text(priority.rawValue)
                            .tag(priority)
                    }
                }
                .pickerStyle(.segmented)
            }

            // Trạng thái hoàn thành
            Toggle(
                "Đã hoàn thành",
                isOn: $editedTodo.isCompleted
            )

            Spacer()

            // Nút lưu thay đổi
            Button {
                todo = editedTodo
                dismiss()
            } label: {

                Label(
                    "Lưu thay đổi",
                    systemImage: "checkmark"
                )
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            // Nút xóa công việc
            Button(role: .destructive) {

                onDelete()
                dismiss()

            } label: {

                Label(
                    "Xóa công việc",
                    systemImage: "trash"
                )
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
        .navigationTitle("Chi tiết")
        .navigationBarTitleDisplayMode(.inline)
    }
}
