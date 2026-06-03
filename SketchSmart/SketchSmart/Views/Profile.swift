import SwiftUI

struct Profile: View {
    @State var isQuit = false
    @State var iaAuthViewPresented = false
    @State private var isEditingName = false
    @State private var isEditingPhone = false
    @State private var showHintOverlay = false
    @State private var chamOverlay = false
    @State private var selectedOption = "Option 1"
    
    @StateObject var viewModel: ProfileViewModel
    
    @FocusState private var isFieldNameFocused: Bool
    @FocusState private var isFieldPhoneFocused: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 16) {
                        VStack {
                            HStack {
                                // Уровень пользователя (счетчик в лампочке)
                                Button {
                                    showHintOverlay = true
                                } label: {
                                    ZStack {
                                        Text("\(viewModel.currentLevel)")
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
                                }
                                
                                // Имя пользователя
                                HStack {
                                    Button {
                                        if isEditingName {
                                            viewModel.setProfile()
                                            isFieldNameFocused = false
                                        } else {
                                            viewModel.getProfile()
                                            isFieldNameFocused = true
                                        }
                                        
                                        withAnimation {
                                            isEditingName.toggle()
                                        }
                                    } label: {
                                        Image(systemName: isEditingName ? "checkmark" : "pencil")
                                            .foregroundStyle(isEditingName ? .turquoise : .darkBlue)
                                            .font(.title2.bold())
                                    }
                                    
                                    TextField("Твое имя", text: $viewModel.profile.name)
                                        .disabled(!isEditingName)
                                        .foregroundColor(isEditingName ? .darkBlue : .gray)
                                        .font(.title2)
                                        .focused($isFieldNameFocused)
                                        .submitLabel(.done)
                                        .onSubmit {
                                            if isEditingName {
                                                viewModel.setProfile()
                                                withAnimation {
                                                    isEditingName = false
                                                    isFieldNameFocused = false
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
                                        if isEditingPhone {
                                            viewModel.setProfile()
                                            isFieldPhoneFocused = false
                                        } else {
                                            viewModel.getProfile()
                                            isFieldPhoneFocused = true
                                        }
                                        
                                        withAnimation {
                                            isEditingPhone.toggle()
                                        }
                                    } label: {
                                        Image(systemName: isEditingPhone ? "checkmark" : "pencil")
                                            .foregroundStyle(isEditingPhone ? .turquoise : .darkBlue)
                                            .bold()
                                    }
                                    
                                    if isEditingPhone {
                                        Text("+ 7")
                                            .foregroundStyle(.darkBlue)
                                    } else {
                                        Text("+ 7")
                                            .foregroundStyle(.gray)
                                    }
                                    
                                    TextField("Телефон", text: Binding(
                                        get: { viewModel.profile.phone },
                                        set: { newValue in
                                            viewModel.profile.phone = viewModel.formatPhoneNumber(newValue)
                                        }
                                    ))
                                    .disabled(!isEditingPhone)
                                    .foregroundColor(isEditingPhone ? .darkBlue : .gray)
                                    .font(.callout)
                                    .focused($isFieldPhoneFocused)
                                    .keyboardType(.numberPad)
                                    .submitLabel(.done)
                                    .onSubmit {
                                        if isEditingPhone {
                                            viewModel.setProfile()
                                            withAnimation {
                                                isEditingPhone = false
                                                isFieldPhoneFocused = false
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
                        
                        HStack(alignment: .center, spacing: 20) {
                            VStack(alignment: .leading, spacing: 12) {
                                // Прогресс уровня
                                VStack(alignment: .leading) {
                                    Text("Уровень \(viewModel.currentLevel)")
                                        .foregroundStyle(.darkBlue)
                                        .font(.headline)
                                    
                                    ProgressView(value: viewModel.levelProgress, total: 1.0)
                                        .progressViewStyle(LinearProgressViewStyle(tint: .turquoise))
                                        .frame(width: 120)
                                        .scaleEffect(y: 2.0, anchor: .center)
                                    
                                    // Отображаем сколько тестов пройдено в текущем уровне
                                    let testsInLevel = Int(viewModel.levelProgress * Double(viewModel.testsForCurrentLevel))
                                    Text("\(testsInLevel)/\(viewModel.testsForCurrentLevel) тестов")
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }
                                
                                // Прогресс облика
                                VStack(alignment: .leading) {
                                    Text("Новый облик")
                                        .foregroundStyle(.darkBlue)
                                        .font(.headline)
                                    
                                    ProgressView(value: viewModel.characterProgress, total: 1.0)
                                        .progressViewStyle(LinearProgressViewStyle(tint: .turquoise))
                                        .frame(width: 120)
                                        .scaleEffect(y: 2.0, anchor: .center)
                                    
                                    // Отображаем сколько уровней пройдено в текущем облике
                                    let levelsInCharacter = Int(viewModel.characterProgress * Double(viewModel.levelsForCurrentCharacter))
                                    Text("\(levelsInCharacter)/\(viewModel.levelsForCurrentCharacter) уровней")
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                chamOverlay = true
                            } label: {
                                Image(viewModel.characterImageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: 170)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, 8)
                        
                        Spacer(minLength: 30)
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 8)
                }
                .scrollDismissesKeyboard(.interactively)
            }
            .navigationTitle("Профиль")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isQuit.toggle()
                    } label: {
                        Image("Image 35")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .confirmationDialog("Точно хочешь выйти?", isPresented: $isQuit, titleVisibility: .visible) {
                        Button("Да") {
                            AuthService.shared.signOut()
                            iaAuthViewPresented.toggle()
                        }
                    }
                    .fullScreenCover(isPresented: $iaAuthViewPresented, onDismiss: nil) {
                        AuthView()
                    }
                }
            }
            .onSubmit {
                viewModel.setProfile()
            }
            .onAppear {
                self.viewModel.getProfile()
                viewModel.loadData()
            }
            .overlay(
                Group {
                    if showHintOverlay {
                        ProfileOverlayView(showOverlay: $showHintOverlay)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.clear)
                            .transition(.opacity)
                    }
                }
            )
            .overlay(
                Group {
                    if chamOverlay {
                        ChamTextView(showOverlay: $chamOverlay, imageName: viewModel.characterImageName)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.clear)
                            .transition(.opacity)
                    }
                }
            )
        }
    }
}

// MARK: - Preview
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
