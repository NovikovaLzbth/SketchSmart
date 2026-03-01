import SwiftUI

struct Profile: View {
    @State var isQuit = false
    @State var iaAuthViewPresented = false
    @State private var isEditing = false
    
    @StateObject var viewModel: ProfileViewModel
    
    @FocusState private var isFieldFocused: Bool
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            
            BlurredCirclesBackground()
            
            ScrollView(.vertical) {
                VStack(spacing: 16) {
                    ZStack {
                        Text("Профиль")
                            .font(.largeTitle.bold())
                            .foregroundStyle(Color.background)
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                isQuit.toggle()
                            } label: {
                                Image("Image 35")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 50)
                            }
                            .confirmationDialog("Точно хочешь выйти?", isPresented: $isQuit, titleVisibility: .visible) {
                                Button("Да") {
                                    iaAuthViewPresented.toggle()
                                }
                            }
                            .fullScreenCover(isPresented: $iaAuthViewPresented, onDismiss: nil) {
                                AuthView()
                            }
                        }
                    }
                    .padding()
                    .background(Color.darkBlue)
                    .cornerRadius(26)
                    .padding(.vertical, 20)
                    .padding(.bottom, 20)
                    
                    VStack {
                        HStack {
                            // Уровень пользователя (счетчик в лампочке)
                            ZStack {
                                Text("1")
                                    .foregroundStyle(.darkBlue)
                                    .font(.title2.bold())
                                    .zIndex(2)
                                    .padding(.bottom)
                                
                                Image("Image 38")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 65)
                                    .zIndex(1)
                            }
                            
                            // Имя пользователя
                            HStack {
                                Button {
                                    if isEditing {
                                        // Сохранение изменений в БД
                                        viewModel.setProfile()
                                        isFieldFocused = false
                                    } else {
                                        viewModel.getProfile()
                                        isFieldFocused = true
                                    }
                                    
                                    withAnimation {
                                        isEditing.toggle()
                                    }
                                } label: {
                                    Image(systemName: isEditing ? "checkmark" : "pencil")
                                        .foregroundStyle(isEditing ? .turquoise : .darkBlue)
                                        .font(.title2.bold())
                                }
                                
                                TextField("Твое имя", text: $viewModel.profile.name)
                                    .disabled(!isEditing)
                                    .foregroundColor(isEditing ? .darkBlue : .gray)
                                    .font(.title2)
                                    .focused($isFieldFocused)
                                    .submitLabel(.done) // Кнопка "Готово" на клавиатуре
                                    .onSubmit {
                                        // Сохранение при нажатии на кнопку "Готово"
                                        if isEditing {
                                            viewModel.setProfile()
                                            withAnimation {
                                                isEditing = false
                                                isFieldFocused = false
                                            }
                                        }
                                    }
                            }
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading) {
                            Text("Дополнительная информация:")
                                .foregroundStyle(.lightBlue)
                                .bold()
                            
                            HStack {
                                Button {
                                    if isEditing {
                                        // Сохранение изменений в БД
                                        viewModel.setProfile()
                                        isFieldFocused = false
                                    } else {
                                        viewModel.getProfile()
                                        isFieldFocused = true
                                    }
                                    
                                    withAnimation {
                                        isEditing.toggle()
                                    }
                                } label: {
                                    Image(systemName: isEditing ? "checkmark" : "pencil")
                                        .foregroundStyle(isEditing ? .turquoise : .darkBlue)
                                        .bold()
                                }
                                
                                if isEditing {
                                    Text("+ 7")
                                        .foregroundStyle(.darkBlue)
                                } else {
                                    Text("+ 7")
                                        .foregroundStyle(.gray)
                                }
                                
                                TextField("Телефон", text: $viewModel.profile.phone)
                                    .disabled(!isEditing)
                                    .foregroundColor(isEditing ? .darkBlue : .gray)
                                    .font(.callout)
                                    .focused($isFieldFocused)
                                    .submitLabel(.done) // Кнопка "Готово" на клавиатуре
                                    .onSubmit {
                                        // Сохранение при нажатии на кнопку "Готово"
                                        if isEditing {
                                            viewModel.setProfile()
                                            withAnimation {
                                                isEditing = false
                                                isFieldFocused = false
                                            }
                                        }
                                    }
                            }
                            
                            Text(viewModel.profile.email)
                                .font(.callout)
                                .foregroundStyle(.lightBlue)
                        }
                        .padding()
                        .background(
                            .ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20)
                        )
                        .overlay(
                            // Градиентная обводка
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(
                                    LinearGradient(
                                        colors: [
                                            .white.opacity(0.5),
                                            .white.opacity(0.2),
                                            .white.opacity(0.5)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1.5
                                )
                        )
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                    }
                    .padding(.bottom, 30)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Уровень 1")
                                .foregroundStyle(.darkBlue)
                            
                            ProgressView(value: Double(0 + 1), total: Double(3))
                                .progressViewStyle(LinearProgressViewStyle(tint: .lightBlue))
                                .frame(width: 80)
                            
                            Text("Прогресс")
                                .foregroundStyle(.darkBlue)
                            
                            ProgressView(value: Double(0 + 1), total: Double(3))
                                .progressViewStyle(LinearProgressViewStyle(tint: .lightBlue))
                                .frame(width: 80)
                        }
                        
                        Spacer()
                        
                        Image("Image 39")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300)
                    }
                }
                .padding(.horizontal, 10)
                .onSubmit {
                    viewModel.setProfile()
                }
                .onAppear {
                    self.viewModel.getProfile()
                }
            }
        }
    }
}

// только для превью тестовый вариант
extension UserModel {
    static var preview: UserModel {
        UserModel(id: "id",
                  name: "Лиза",
                  phone: "9048507420",
                  email: "l@mail.com")
    }
}

#Preview {
    Profile(viewModel: ProfileViewModel(profile: .preview))
}
