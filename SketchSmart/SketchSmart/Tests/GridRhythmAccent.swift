import SwiftUI

struct GridRhythmAccentView: View {
    let testId = "gra_test"
    
    @StateObject private var viewModel: TestViewModel
    
    static let questions = [
        Question(
            text: "Кем ты становишься для элементов на листе?",
            options: [
                "Художником",
                "Зрителем",
                "Режиссером",
                "Критиком"
            ],
            correctAnswer: 2,
            image: "wand.and.stars"
        ),
        Question(
            text: "Что такое выравнивание простыми словами?",
            options: [
                "Прилипание элементов к невидимым линиям",
                "Расположение всего по центру",
                "Случайное размещение",
                "Только левый край"
            ],
            correctAnswer: 0,
            image: "grid"
        ),
        Question(
            text: "Что дает выравнивание в дизайне?",
            options: [
                "Разнообразие",
                "Аккуратность и порядок",
                "Яркость",
                "Глубину"
            ],
            correctAnswer: 1,
            image: "align.horizontal.left"
        ),
        Question(
            text: "Как работает ритм?",
            options: [
                "Повторяющиеся элементы создают единство",
                "Все элементы должны быть разными",
                "Ритм нужен только в музыке",
                "Нужно повторять только картинки"
            ],
            correctAnswer: 0,
            image: "rhythm"
        ),
        Question(
            text: "Что будет, если в списке использовать одинаковые маркеры?",
            options: [
                "Станет скучно",
                "Появится ритм и целостность",
                "Сломается верстка",
                "Упадет читаемость"
            ],
            correctAnswer: 1,
            image: "list.bullet"
        ),
        Question(
            text: "Какой инструмент лучше всего указывает на самое главное?",
            options: [
                "Выравнивание",
                "Повтор",
                "Контраст",
                "Воздух"
            ],
            correctAnswer: 2,
            image: "bolt.fill"
        ),
        Question(
            text: "Как размером создать контраст?",
            options: [
                "Сделать все буквы одинаковыми",
                "Сделать одну ОГРОМНУЮ букву рядом с мелкими",
                "Уменьшить все буквы",
                "Увеличить расстояние"
            ],
            correctAnswer: 1,
            image: "textformat.size"
        )
    ]
    
    init() {
        _viewModel = StateObject(wrappedValue: TestViewModel(testId: "gra_test", questions: Self.questions))
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
                        Text("Ты разобрался с сеткой, ритмом и акцентом!")
                            .font(.headline)
                            .foregroundStyle(Color.lightBlue)
                            .multilineTextAlignment(.center)
                            .padding()
                    } else {
                        Text("Попробуй ещё раз! Помни: ты — режиссер, который расставляет актеров (элементы) на сцене (листе)!")
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
