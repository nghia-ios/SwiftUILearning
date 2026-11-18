
import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                // Ảnh đại diện
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .foregroundColor(.blue)

                // Thông tin cá nhân
                VStack(spacing: 8) {
                    Text("Nguyễn Huy Nghĩa")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("iOS Developer")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Divider()

                // Email
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.blue)

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Email")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        Text("nguyenhuynghia@gmail.com")
                            .font(.body)
                    }

                    Spacer()
                }

                // Nút chỉnh sửa
                Button {
                    print("Chỉnh sửa hồ sơ")
                } label: {
                    Text("Chỉnh sửa hồ sơ")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
