import SwiftUI

struct UserInputView: View {

    @Binding var name: String
    @Binding var email: String

    var body: some View {

        VStack(spacing: 15) {

            TextField("Nhập họ tên", text: $name)
                .textFieldStyle(.roundedBorder)

            TextField("Nhập email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)

        }
    }
}
