import SwiftUI

struct AuthView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            
                VStack(spacing: 40) {
                    Text("Авторизация")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.lightBlue)
                    
                    VStack {
                        TextField("Введи email", text: $email)
                            .padding()
                            .background(Color("lightGray").opacity(0.5))
                            .cornerRadius(20)
                            .padding(.vertical, 5)
                        
                        SecureField("Введи пароль", text: $password)
                            .padding()
                            .background(Color("lightGray").opacity(0.5))
                            .cornerRadius(20)
                        
                        Button {
                            print("auth")
                        } label: {
                            Text("Войти")
                                .foregroundStyle(Color.background)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(LinearGradient(colors: [Color("turquoise"), Color("lightBlue")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .cornerRadius(20)
                                .padding(.vertical, 5)
                                .font(.title3.bold())
                        }
                        
                        Button {
                            print("auth")
                        } label: {
                            Text("Создать аккаунт?")
                                .foregroundStyle(Color.lightBlue)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .cornerRadius(20)
                                .padding(.vertical, 5)
                        }

                    }
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
    }
}

#Preview {
    AuthView()
}
