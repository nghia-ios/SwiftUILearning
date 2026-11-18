
import SwiftUI

class TaskViewModel: ObservableObject {

    // MARK: - Quản lý dữ liệu
    @Published var tasks: [TodoItem]
    
    // Từ khoá tìm kiếm
    @Published var searchText = ""
    
    // Trạng thái lọc công việc
    @Published var selectedFilter = "Tất cả"
    
    // Trạng thái sắp xếp
    @Published var selectedSort = "Mới nhất"
    
    // Danh sách công việc đã tìm kiếm, lọc và sắp xếp
    var sortedTasks: [TodoItem] {
        
        var result = filteredTasks
        
        switch selectedSort {
            
        case "Tên A-Z":
            result.sort {
                $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending
            }
        
        case "Tên Z-A":
            result.sort {
                $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedDescending
            }
            
        case "Chưa hoàn thành trước":
            result.sort {
                !$0.isCompleted && $1.isCompleted
            }
            
        case "Đã hoàn thành trước":
            result.sort {
                $0.isCompleted && !$1.isCompleted
            }
            
        default:
            result.sort {
                $0.createdAt > $1.createdAt
            }
        }
        return result
    }
    
    // Danh sách công việc sau khi tìm kiếm và lọc
    var filteredTasks: [TodoItem] {
        var result = tasks
        
        // MARK: - Tìm kiếm theo tên
        if !searchText.isEmpty {
            result = result.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        // MARK: - Lọc theo trạng thái
        
        switch selectedFilter {
            
        case "Đã hoàn thành":
            result = result.filter { $0.isCompleted }
            
        case "Chưa hoàn thành":
            result = result.filter { !$0.isCompleted }
            
        default:
            break
        }
        return result
    }
    
    // MARK: - Tổng số công việc
    var totalTask: Int {
        tasks.count
    }
    
    // MARK: - Số công việc đã hoàn thành
    var completedTasks: Int {
        tasks.filter { $0.isCompleted }.count
    }
    
    // MARK: - Số công việc chưa hoàn thành
    var uncompletedTasks: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    
    // MARK: - Xoá toàn bộ công việc
    func deleteAllTasks() {
        tasks.removeAll()
        saveTasks()
    }

    private let storageKey = "savedTasks"

    // MARK: - Khởi tạo

    init() {

        self.tasks = Self.loadTasks()
    }

    // MARK: - Thêm công việc

    func addTask(title: String) {

        let newTitle = title.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !newTitle.isEmpty else {
            return
        }

        let newTask = TodoItem(title: newTitle)

        tasks.append(newTask)

        saveTasks()
    }

    // MARK: - Xóa công việc

    func deleteTask(at offsets: IndexSet) {

        tasks.remove(atOffsets: offsets)

        saveTasks()
    }

    // MARK: - Đánh dấu hoàn thành

    func toggleTask(id: UUID) {

        guard let index = tasks.firstIndex(
            where: { $0.id == id }
        ) else {
            return
        }

        tasks[index].isCompleted.toggle()

        saveTasks()
    }

    // MARK: - Lưu dữ liệu

    private func saveTasks() {

        do {

            let encoder = JSONEncoder()

            let data = try encoder.encode(tasks)

            UserDefaults.standard.set(
                data,
                forKey: storageKey
            )

        } catch {

            print("Lỗi lưu dữ liệu: \(error)")
        }
    }

    // MARK: - Đọc dữ liệu

    private static func loadTasks() -> [TodoItem] {

        let storageKey = "savedTasks"

        guard let data = UserDefaults.standard.data(
            forKey: storageKey
        ) else {

            return [
                TodoItem(title: "Học Swift"),
                TodoItem(title: "Học SwiftUI"),
                TodoItem(title: "Xây dựng ứng dụng iOS"),
                TodoItem(title: "Học tiếng Anh"),
                TodoItem(title: "Kiên trì"),
                TodoItem(title: "Kỷ luật")
            ]
        }

        do {

            let decoder = JSONDecoder()

            return try decoder.decode(
                [TodoItem].self,
                from: data
            )

        } catch {

            print("Lỗi đọc dữ liệu: \(error)")

            return []
        }
    }
}
