import SwiftUI

struct FloatingActionButton: View {
    let action: () -> Void
    let icon: String
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.title2.bold())
                .foregroundColor(.white)
                .frame(width: 56, height: 56)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .purple]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}

#Preview {
    ZStack {
        Color(.systemBackground)
            .ignoresSafeArea()
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                FloatingActionButton(action: {}, icon: "plus")
                    .padding()
            }
        }
    }
}
