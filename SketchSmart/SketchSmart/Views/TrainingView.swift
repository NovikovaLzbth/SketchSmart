import SwiftUI
import CoreData

struct TrainingView: View {
    @StateObject private var progressManager = ProgressManager.shared
    
    let topics: [String] = [
        "Введение",
        "Точка, линия, пятно",
        "Радуга-помощница",
        "Типографика",
        "Композиция",
        "Сетка, Ритм, Акцент",
        "Идея и Эмоция",
        "Форма и функция",
        "Дизайн-мышление"
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
                        VStack(spacing: 15) {
                            ForEach(topics, id: \.self) { topic in
                                TopicLockedButton(
                                    title: topic,
                                    isUnlocked: progressManager.isTopicUnlocked(topic),
                                    requiredTestId: getRequiredTestId(for: topic)
                                )
                            }
                        }
                        .padding()
                    }
                    .refreshable {
                        progressManager.refreshProgress()
                    }
                }
            }
            .navigationTitle("Обучение")
            .onAppear {
                progressManager.loadProgress()
            }
        }
    }
    
    private func getRequiredTestId(for topic: String) -> String? {
        if topic == "Введение" { return nil }
        
        // Для темы нужен тест ПРЕДЫДУЩЕЙ темы
        guard let index = topics.firstIndex(of: topic),
              index > 0 else { return nil }
        
        let previousTopic = topics[index - 1]
        return progressManager.getTestId(for: previousTopic)
    }
}

struct TopicLockedButton: View {
    let title: String
    let isUnlocked: Bool
    let requiredTestId: String?
    
    @StateObject private var progressManager = ProgressManager.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Основная кнопка темы
            NavigationLink(destination: getDestination(for: title)) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.title2.bold())
                            .foregroundStyle(isUnlocked ? Color.background : Color.background.opacity(0.6))
                        
                        if !isUnlocked {
                            Text("Пройди предыдущий тест")
                                .font(.caption)
                                .foregroundColor(.background)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(30)
                    
                    if !isUnlocked {
                        Text("🔒")
                            .font(.title3)
                            .padding(.trailing, 30)
                    }
                }
            }
            .disabled(!isUnlocked)
            .background(isUnlocked ? Color.lightBlue : Color.lightBlue.opacity(0.5))
            .cornerRadius(23)
            
            // Кнопка перехода к нужному тесту (если заблокировано)
            if !isUnlocked, let testId = requiredTestId {
                HStack {
                    Spacer()
                    NavigationLink(destination: getTestDestination(for: testId)) {
                        HStack(spacing: 6) {
                            Image(systemName: "questionmark.circle.fill")
                                .font(.caption)
                            Text("Пройти тест «\(getPreviousTopicName(for: testId))», чтобы открыть")
                                .font(.caption)
                        }
                        .foregroundColor(.darkBlue)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.turquoise.opacity(0.3))
                        .cornerRadius(100)
                    }
                    Spacer()
                }
                .padding(.top, 4)
            }
        }
    }
    
    @ViewBuilder
    private func getDestination(for title: String) -> some View {
        switch title {
        case "Введение": Introduction()
        case "Точка, линия, пятно": PointLineStain()
        case "Радуга-помощница": Rainbow()
        case "Типографика": Typography()
        case "Композиция": Composition()
        case "Сетка, Ритм, Акцент": GrRhAccent()
        case "Идея и Эмоция": Idea()
        case "Форма и функция": FormFunction()
        case "Дизайн-мышление": DesignThinking()
        default: EmptyView()
        }
    }
    
    @ViewBuilder
    private func getTestDestination(for testId: String) -> some View {
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
    
    private func getPreviousTopicName(for testId: String) -> String {
        switch testId {
        case "pointline_test": return "Точка, линия, пятно"
        case "rnbw_test": return "Радуга-помощница"
        case "typography_test": return "Типографика"
        case "composition_test": return "Композиция"
        case "grid_test": return "Сетка, Ритм, Акцент"
        case "idea_test": return "Идея и Эмоция"
        case "form_test": return "Форма и функция"
        case "design_test": return "Дизайн-мышление"
        default: return "предыдущий"
        }
    }
}
