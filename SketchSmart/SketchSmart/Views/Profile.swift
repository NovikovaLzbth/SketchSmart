import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            
            
            HStack(spacing: 16) {
                Spacer()
                
                Text("Profile")
                
                Spacer()
                
                Image("Image 35")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 70)
            }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    Profile()
}
