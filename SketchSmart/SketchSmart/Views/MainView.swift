//
//  MainView.swift
//  SketchSmart
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI
import CoreData

struct MainView: View {
    @StateObject private var progressManager = ProgressManager.shared
    
    let orderedTests: [(title: String, testId: String)] = [
        ("Точка, линия, пятно", "pointline_test"),
        ("Радуга-помощница", "rnbw_test"),
        ("Типографика", "typography_test"),
        ("Композиция", "composition_test"),
        ("Сетка, Ритм, Акцент", "grid_test"),
        ("Идея и Эмоция", "idea_test"),
        ("Форма и Функция", "form_test"),
        ("Дизайн-мышление", "design_test")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                
                if progressManager.isLoading {
                    ProgressView()
                        .tint(.lightBlue)
                        .scaleEffect(1.5)
                } else {
                    ScrollView(.vertical) {
                        VStack(spacing: 12) {
                            GamesSection()
                                .padding(.bottom, 10)
                            
                            // Заголовок
                            HStack {
                                Text("Тесты:")
                                    .font(.headline)
                                    .foregroundColor(.darkBlue)
                                
                                Spacer()
                            }
                            
                            // Тесты в сетке
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 8) {
                                ForEach(orderedTests, id: \.testId) { test in
                                    LockedTestButton(
                                        title: test.title,
                                        testId: test.testId,
                                        isCompleted: progressManager.completedTests.contains(test.testId),
                                        isAvailable: progressManager.canTakeTest(test.testId)
                                    )
                                }
                            }
                            
                            // Информация о разблокировке
                            if let nextTestId = progressManager.getNextRequiredTest(),
                               let nextTopic = progressManager.getTopicTitle(for: nextTestId) {
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Image(systemName: "info.circle.fill")
                                            .foregroundColor(.turquoise)
                                        Text("Следующий тест:")
                                            .font(.subheadline)
                                            .foregroundColor(.darkBlue)
                                            .fontWeight(.medium)
                                        Text(nextTopic)
                                            .font(.subheadline)
                                            .foregroundColor(.lightBlue)
                                    }
                                    Text("Чтобы открыть новую тему, нужно пройти текущий тест")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(12)
                                .padding(.vertical, 10)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 16)
                    }
                    .refreshable {
                        progressManager.refreshProgress()
                    }
                }
            }
            .navigationTitle("Проверь себя!")
            .onAppear {
                progressManager.loadProgress()
            }
        }
    }
}

struct LockedTestButton: View {
    let title: String
    let testId: String
    let isCompleted: Bool
    let isAvailable: Bool
    
    @State private var showAlert = false
    
    var body: some View {
        Button(action: {
            if isAvailable {
            } else {
                showAlert = true
            }
        }) {
            NavigationLink(destination: getTestDestination()) {
                VStack(spacing: 8) {
                    if !isAvailable {
                        Text("🔒")
                            .font(.title3)
                            .foregroundColor(.background.opacity(0.7))
                    }
                    
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(isAvailable ? .background : .background.opacity(0.6))
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                    
                    if isCompleted {
                        HStack(spacing: 4) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.caption)
                            Text("Пройден")
                                .font(.caption)
                        }
                        .foregroundColor(.white.opacity(0.6))
                    } else if !isAvailable {
                        Text("Заблокирован")
                            .font(.caption2)
                            .foregroundColor(.background.opacity(0.6))
                    }
                }
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .background(
                    isCompleted ? Color.lightBlue :
                    (isAvailable ? Color.lightBlue : Color.lightBlue.opacity(0.4))
                )
                .cornerRadius(20)
            }
            .disabled(!isAvailable)
        }
        .disabled(!isAvailable)
        .alert("Тест недоступен", isPresented: $showAlert) {
            Button("Понятно", role: .cancel) { }
        } message: {
            Text("Сначала нужно пройти предыдущий тест и открыть тему в разделе «Обучение»")
        }
    }
    
    @ViewBuilder
    private func getTestDestination() -> some View {
        switch testId {
        case "pointline_test": Pls()
        case "rnbw_test": Rnbw()
        case "typography_test": Tpgrph()
        case "composition_test": CompositionView()
        case "grid_test": GridRhythmAccentView()
        case "idea_test": IdeaTest()
        case "form_test": FormFunctionTest()
        case "design_test": DesignThinkingTest()
        default: EmptyView()
        }
    }
}

struct GamesSection: View {
    var body: some View {
        VStack(spacing: 8) {
            NavigationLink {
                GameView()
            } label: {
                Text("🎮 Игра для цветовосприятия")
                    .font(.title3)
                    .foregroundColor(.background)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
            }
            .background(Color.turquoise)
            .cornerRadius(100)
            
            NavigationLink {
                MemoryPaletteGameView()
            } label: {
                Text("🧩 Палитра памяти")
                    .font(.title3)
                    .foregroundColor(.background)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
            }
            .background(Color.turquoise)
            .cornerRadius(100)
        }
        .foregroundStyle(.darkBlue)
    }
}

#Preview {
    MainView()
}

