import SwiftUI

struct AuthView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    // Состояние зарагистрирован / нет
    @State private var isAuth: Bool = true
    
    @State private var isContentViewShow = false
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
                .zIndex(0)
            
            VStack {
                Image("Image 36")
                    .scaledToFit()
                    .frame(maxHeight: 25)
                
                Spacer()
            }
            .ignoresSafeArea(.all)
            .zIndex(1)
            
            VStack(spacing: 50) {
                if isAuth {
                    Text("Авторизация")
                        .foregroundStyle(Color.darkBlue)
                        .font(.largeTitle.bold())
                        .padding(.top)
                } else {
                    Text("Регистрация")
                        .foregroundStyle(Color.darkBlue)
                        .font(.largeTitle.bold())
                        .padding(.top)
                }
                
                VStack {
                    TextField("Введи email", text: $email)
                        .frame(maxWidth: 300, maxHeight: 40)
                        .padding()
                        .background(Color("lightGray").opacity(0.5))
                        .cornerRadius(20)
                    
                    SecureField("Введи пароль", text: $password)
                        .frame(maxWidth: 300, maxHeight: 40)
                        .padding()
                        .background(Color("lightGray").opacity(0.5))
                        .cornerRadius(20)
                }
                
                VStack {
                    Button {
                        if isAuth {
                            print("auth")
                            self.isContentViewShow.toggle()
                        } else {
                            print("reg")
                            self.email = ""
                            self.password = ""
                            self.confirmPassword = ""
                            self.isAuth.toggle()
                        }
                    } label: {
                        Text(isAuth ? "Войти" : "Создать аккаунт")
                            .frame(maxWidth: 300, maxHeight: 40)
                            .foregroundStyle(Color.background)
                            .padding()
                            .background(LinearGradient(
                                colors: isAuth ?
                                [Color("turquoise"), Color("lightBlue")] :
                                    [Color("lightBlue"), Color("turquoise")],
                                startPoint: .leading,
                                endPoint: .trailing))
                            .cornerRadius(20)
                            .font(.title3.bold())
                    }
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 3, y: 5)

                    if isAuth {
                        Button {
                            isAuth.toggle()
                        } label: {
                            Text("Еще нет аккаунта?")
                                .foregroundStyle(Color.lightBlue)
                                .padding()
                        }
                    } else {
                        Button {
                            isAuth.toggle()
                        } label: {
                            Text("Войти в аккаунт?")
                                .foregroundStyle(Color.lightBlue)
                                .padding()
                        }
                    }
                    
                    Text("ИЛИ")
                        .padding()
                        .foregroundStyle(Color.lightBlue)
                    
                    Image("Image 37")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 60)
                }
            }
            .padding()
            .padding(.horizontal, 20)
            .frame(width: .infinity)
            .background(Color.background)
            .cornerRadius(30)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .fullScreenCover(isPresented: $isContentViewShow) {
                ContentView()
            }
            .zIndex(2)
        }
        .animation(.easeInOut(duration: 0.3), value: isAuth)
    }
}

#Preview {
    AuthView()
}
