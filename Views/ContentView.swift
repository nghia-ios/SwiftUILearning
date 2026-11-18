import SwiftUI

struct ContentView: View {

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {

            Text("Đăng nhập")
                .font(.largeTitle)
                .bold()

            TextField("Nhập email", text: $email)
                .textFieldStyle(.roundedBorder)

            SecureField("Nhập mật khẩu", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Đăng nhập") {
                print("Login button clicked")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
