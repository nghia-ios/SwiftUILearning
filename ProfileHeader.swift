import SwiftUI

struct ProfileHeader: View {

    var body: some View {

        VStack(spacing: 10) {

            Image(systemName: "person.circle.fill")
                .font(.system(size: 70))
                .foregroundStyle(.blue)

            Text("Thông tin cá nhân")
                .font(.title)
                .bold()

        }
    }
}
