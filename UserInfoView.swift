import SwiftUI

struct UserInfoView: View {

    var name: String
    var email: String

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("Thông tin đã cập nhật")
                .font(.headline)

            Text("Họ tên: \(name)")

            Text("Email: \(email)")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
