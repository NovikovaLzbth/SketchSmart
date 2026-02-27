import SwiftUI
import FirebaseAuth
import Firebase

struct AuthView: View {
    @State private var email = ""
    @State private var password = ""
    
    // Состояние зарагистрирован / нет
    @State private var isAuth: Bool = true
    
    @State private var isContentViewShow = false
    
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
                .zIndex(0)
            
            VStack {
                Image("Image 36")
                    .resizable()
                    .scaledToFit()
                
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
                            self.isContentViewShow.toggle()
                        } else {
                            guard !email.isEmpty else {
                                alertMessage = "Заполни поле Email"
                                self.isShowAlert = true
                                return
                            }
                            
                            guard !password.isEmpty else {
                                alertMessage = "Заполни поле Пароль"
                                self.isShowAlert = true
                                return
                            }
                            
                            guard password.count >= 6 else {
                                alertMessage = "Пароль должен содержать минимум 6 символов"
                                self.isShowAlert = true
                                return
                            }
                            
                            guard email.contains("@") && email.contains(".") else {
                                alertMessage = "Введи корректный Email"
                                self.isShowAlert = true
                                return
                            }
                            
                            AuthService.shared.signUp(email: self.email,
                                                      password: self.password) { result in
                                DispatchQueue.main.async {
                                    switch result {
                                    case .success(let user):
                                        alertMessage = "Ты зарегистрировался с Email \(user.email!)"
                                        
                                        self.email = ""
                                        self.password = ""
                                        self.isAuth.toggle()
                                        self.isShowAlert = true
                                        
                                    case .failure(let error):
                                        print("Ошибка регистрации: \(error)")
                                        
                                        alertMessage = "Ошибка регистрации"
                                        
                                        self.isShowAlert = true
                                    }
                                }
                            }
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
                    .alert(isPresented: $isShowAlert) {
                        Alert(
                            title: Text("Регистрация"),
                            message: Text(alertMessage),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    
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
            .padding(.top, 100)
            .alert(alertMessage, isPresented: $isShowAlert) {
                Button { } label: {
                    Text("ОК")
                }
                
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isAuth)
    }
}

#Preview {
    AuthView()
}
