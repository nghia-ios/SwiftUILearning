import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Login Screen")
                .font(.largeTitle)

            TextField("Enter email", text: .constant(""))
        }
        .padding()
    }
}
