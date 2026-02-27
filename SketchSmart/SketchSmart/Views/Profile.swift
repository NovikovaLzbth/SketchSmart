import SwiftUI

struct Profile: View {
    @State var isQuit = false
    @State var iaAuthViewPresented = false
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    Spacer()
                    
                    Text("Profile")
                    
                    Spacer()
                    
                    Image("Image 35")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 70)
                }
                
                VStack {
                    Text("Имя")
                    
                    Text("Почта")
                }
                
                Button {
                    isQuit.toggle()
                } label: {
                    Text("Выйти")
                }
                .confirmationDialog("Точно хочешь выйти?", isPresented: $isQuit) {
                    Button {
                        iaAuthViewPresented.toggle()
                    } label: {
                        Text("Да")
                    }
                }
                .fullScreenCover(isPresented: $iaAuthViewPresented, onDismiss: nil) {
                    AuthView()
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    Profile()
}
