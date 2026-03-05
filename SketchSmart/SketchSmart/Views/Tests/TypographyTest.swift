import SwiftUI
import CoreData

struct Tpgrph: View {
    
    let testId = "tpgrph_test"
    
    @StateObject private var viewModel: TestViewModel
    
    static let questions = [
        Question(
            text: "Какие шрифты выглядят как «деловой костюм»?",
            options: [
                "С гротесками",
                "С засечками",
                "Моноширинные",
                "Рубленые"
            ],
            correctAnswer: 1,
            image: "textformat"
        ),
        Question(
            text: "Почему шрифты без засечек называют «спортивным костюмом»?",
            options: [
                "Носят только кроссовки",
                "Чистые, простые, легко читаются",
                "Всегда наклонены вперед",
                "Слишком узкие"
            ],
            correctAnswer: 1,
            image: "figure.run"
        ),
        Question(
            text: "Когда уместно использовать декоративные шрифты?",
            options: [
                "Для романа в 500 страниц",
                "Для короткого заголовка или вывески",
                "Для школьного учебника",
                "Для научной статьи"
            ],
            correctAnswer: 1,
            image: "balloon"
        ),
        Question(
            text: "Какое правило в типографике САМОЕ главное?",
            options: [
                "Красота",
                "Уникальность",
                "Удобочитаемость",
                "Яркость"
            ],
            correctAnswer: 2,
            image: "eye"
        ),
        Question(
            text: "Чем леттеринг отличается от обычного шрифта?",
            options: [
                "Это компьютерная программа",
                "Это только рукописные буквы",
                "Это старые советские шрифты",
                "Буквы рисуют, обыгрывая смысл слова"
            ],
            correctAnswer: 3,
            image: "paintbrush"
        ),
        Question(
            text: "Как лучше обыграть слово «СОЛНЦЕ» в леттеринге?",
            options: [
                "Написать очень мелко",
                "Сделать все буквы квадратными",
                "В букве «О» нарисовать солнце",
                "Написать желтым цветом"
            ],
            correctAnswer: 2,
            image: "sun.max"
        ),
        Question(
            text: "Какой текст бабушка в очках НЕ сможет прочитать?",
            options: [
                "Светло-серый на белом",
                "Черный на белом",
                "Синий на белом",
                "Белый на черном"
            ],
            correctAnswer: 0,
            image: "exclamationmark.triangle"
        ),
        Question(
            text: "Что такое «характер шрифта»?",
            options: [
                "Это только размер букв",
                "Это настроение, которое создают буквы",
                "Это цвет текста",
                "Это расстояние между буквами"
            ],
            correctAnswer: 1,
            image: "brain"
        )
    ]
    
    init() {
        _viewModel = StateObject(wrappedValue: TestViewModel(testId: "tpgrph_test", questions: Self.questions))
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
                        Text("Ты отлично понял типографику!")
                            .font(.headline)
                            .foregroundStyle(Color.lightBlue)
                            .multilineTextAlignment(.center)
                            .padding()
                    } else {
                        Text("Попробуй ещё раз! Помни: каждая буква — это актер. А шрифт — это его костюм, грим и голос!")
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
