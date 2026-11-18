import SwiftUI

struct UpdateButton: View {

    var action: () -> Void

    var body: some View {

        Button("Cập nhật thông tin") {
            action()
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
