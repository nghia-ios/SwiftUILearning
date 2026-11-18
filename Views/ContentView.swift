import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack(spacing: 20) {

            Text("Hello iOS Developer!")
                .font(.largeTitle)
                .bold()

            Text("I am learning Git and GitHub")
                .foregroundStyle(.blue)

            Text("My goal: Professional iOS Developer")
        }
        .padding()
    }
}
