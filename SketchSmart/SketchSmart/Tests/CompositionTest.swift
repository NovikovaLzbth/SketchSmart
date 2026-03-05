import SwiftUI
import CoreData
import AVFoundation

struct CompositionView: View {
    let testId = "cmpstn_test"
    
    @StateObject private var viewModel: TestViewModel
    
    static let questions = [
        Question(
            text: "Кем ты становишься для глаз зрителя в композиции?",
            options: [
                "Художником",
                "Экскурсоводом",
                "Фотографом",
                "Программистом"
            ],
            correctAnswer: 1,
            image: "figure.wave"
        ),
        Question(
            text: "Сколько главных героев должно быть в одной работе?",
            options: [
                "Чем больше, тем лучше",
                "Два, для симметрии",
                "Один самый главный",
                "Минимум пять"
            ],
            correctAnswer: 2,
            image: "star.fill"
        ),
        Question(
            text: "Почему главный герой лучше смотрится не в центре?",
            options: [
                "В центре слишком статично",
                "Центр всегда пустой",
                "Так его не увидят",
                "Центр только для текста"
            ],
            correctAnswer: 0,
            image: "move.3d"
        ),
        Question(
            text: "Что в композиции называют «воздухом»?",
            options: [
                "Облака на фоне",
                "Пустое пространство вокруг элементов",
                "Синий цвет",
                "Размытые края"
            ],
            correctAnswer: 1,
            image: "wind"
        ),
        Question(
            text: "Как работает визуальный баланс?",
            options: [
                "Как качели: тяжелое слева надо уравновесить справа",
                "Все элементы должны быть одинаковыми",
                "Баланс не важен",
                "Всегда нужна идеальная симметрия"
            ],
            correctAnswer: 0,
            image: "scalemass"
        ),
        Question(
            text: "Чем можно незаметно направить взгляд зрителя?",
            options: [
                "Рамками",
                "Только стрелками",
                "Подписями",
                "Направляющими линиями"
            ],
            correctAnswer: 3,
            image: "arrow.triangle.turn.up.right.diamond"
        )
    ]
    
    init() {
        _viewModel = StateObject(wrappedValue: TestViewModel(testId: "cmpstn_test", questions: Self.questions))
    }
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            if !viewModel.showResults {
                VStack(spacing: 20) {
                    // Прогресс
                    HStack {
                        Text("Вопрос \(viewModel.currentQuestion + 1)/\(viewModel.totalQuestions)")
                            .font(.headline)
                            .foregroundColor(.lightBlue)
                        
                        Spacer()
                        
                        Text("Очки: \(viewModel.score)")
                            .font(.headline)
                            .foregroundColor(.turquoise)
                    }
                    .padding(.horizontal)
                    
                    // Индикатор прогресса
                    ProgressView(value: Double(viewModel.currentQuestion + 1), total: Double(viewModel.totalQuestions))
                        .progressViewStyle(LinearProgressViewStyle(tint: .lightBlue))
                        .padding(.horizontal)
                    
                    // Вопрос с иконкой
                    VStack(spacing: 15) {
                        Image(systemName: viewModel.currentQuestionData.image)
                            .font(.system(size: 50))
                            .foregroundColor(.turquoise)
                        
                        Text(viewModel.currentQuestionData.text)
                            .font(.title2)
                            .foregroundStyle(.darkBlue)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding(.vertical, 30)
                    
                    // Варианты ответов
                    VStack(spacing: 12) {
                        ForEach(0..<viewModel.currentQuestionData.options.count, id: \.self) { index in
                            Button(action: {
                                viewModel.checkAnswer(index)
                            }) {
                                HStack(alignment: .top) {
                                    Text(viewModel.currentQuestionData.options[index])
                                        .font(.body)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(.darkBlue)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    Spacer(minLength: 8)
                                    
                                    if viewModel.showFeedback && viewModel.selectedAnswer == index {
                                        Image(systemName: viewModel.isAnswerCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                            .foregroundColor(viewModel.isAnswerCorrect ? .green : .red)
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(
                                            viewModel.selectedAnswer == index ?
                                            (viewModel.isAnswerCorrect ? Color.green.opacity(0.2) : Color.red.opacity(0.2)) :
                                                Color.gray.opacity(0.1)
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(
                                                    viewModel.selectedAnswer == index ?
                                                    (viewModel.isAnswerCorrect ? Color.green : Color.red) :
                                                        Color.lightGray,
                                                    lineWidth: 2
                                                )
                                        )
                                )
                            }
                            .disabled(viewModel.showFeedback)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // Кнопка продолжения
                    if viewModel.showFeedback {
                        Button(action: viewModel.nextQuestion) {
                            Text(viewModel.isLastQuestion ? "Узнать результат" : "Следующий вопрос")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.darkBlue)
                                .cornerRadius(20)
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            } else {
                // Экран результатов
                VStack(spacing: 30) {
                    Image(systemName: viewModel.isPerfectScore ? "trophy.fill" :
                            (viewModel.isPassingScore ? "star.fill" : "lightbulb.fill"))
                    .font(.system(size: 70))
                    .foregroundColor(viewModel.isPassingScore ? .yellow : .orange)
                    
                    Text(viewModel.isPassingScore ? "Отлично!" : "Не время сдаваться!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.darkBlue)
                    
                    // Шкала результата
                    VStack(spacing: 10) {
                        Text("Твой уровень:")
                            .font(.headline)
                            .foregroundStyle(Color.darkBlue)
                        
                        HStack {
                            ForEach(0..<viewModel.totalQuestions, id: \.self) { index in
                                Rectangle()
                                    .fill(index < viewModel.score ? Color.turquoise : Color.gray.opacity(0.3))
                                    .frame(height: 20)
                                    .cornerRadius(5)
                            }
                        }
                    }
                    .padding()
                    
                    if viewModel.isPassingScore {
                        Text("Ты отлично понял основы композиции!")
                            .font(.headline)
                            .foregroundStyle(Color.lightBlue)
                            .multilineTextAlignment(.center)
                            .padding()
                    } else {
                        Text("Попробуй ещё раз! Помни: твоя задача — провести взгляд зрителя по твоей работе по нужному маршруту!")
                            .font(.headline)
                            .foregroundColor(.lightBlue)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                    Button(action: {
                        viewModel.resetTest()
                    }) {
                        HStack{
                            Image(systemName: "arrow.clockwise")
                            Text("Пройти ещё раз")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.darkBlue)
                        .cornerRadius(20)
                        .padding(.horizontal, 40)
                    }
                }
                .padding()
            }
        }
        .animation(.spring(response: 0.2), value: viewModel.showFeedback)
        .animation(.spring(response: 0.2), value: viewModel.showResults)
        .onAppear {
            viewModel.loadUserData()
        }
    }
}
