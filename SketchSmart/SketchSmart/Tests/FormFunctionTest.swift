import SwiftUI

struct FormFunctionTest: View {
    let testId = "formfunc_test"
    
    @StateObject private var viewModel: TestViewModel
    
    static let questions = [
        Question(
            text: "Кем становится дизайнер, если думает не только о красоте, но и о чувствах?",
            options: [
                "Художником",
                "Заказчиком",
                "Фотографом",
                "Инженером впечатлений"
            ],
            correctAnswer: 3,
            image: "wrench.and.screwdriver"
        ),
        
        Question(
            text: "Что такое текстура простыми словами?",
            options: [
                "Цвет предмета",
                "Форма предмета",
                "Поверхность предмета",
                "Размер предмета"
            ],
            correctAnswer: 2,
            image: "hand.raised.fingers.spread"
        ),
        
        Question(
            text: "Какое ощущение дает гладкая текстура (стекло, лед)?",
            options: [
                "Тепло и уют",
                "Прохладу и чистоту",
                "Мягкость и нежность",
                "Грубость и надежность"
            ],
            correctAnswer: 1,
            image: "drop"
        ),
        
        Question(
            text: "Что мы чувствуем, глядя на шершавую текстуру дерева?",
            options: [
                "Холод и технологичность",
                "Дороговизну и блеск",
                "Тепло и натуральность",
                "Опасность и остроту"
            ],
            correctAnswer: 2,
            image: "leaf"
        ),
        
        Question(
            text: "Какую текстуру используют, чтобы передать ощущение нежности и безопасности?",
            options: [
                "Металлическую",
                "Стеклянную",
                "Мягкую (мех, ткань)",
                "Каменную"
            ],
            correctAnswer: 2,
            image: "cat"
        ),
        
        Question(
            text: "Что символизирует блестящая металлическая поверхность?",
            options: [
                "Природу и экологию",
                "Уют и тепло",
                "Дороговизну и технологии",
                "Легкость и воздушность"
            ],
            correctAnswer: 0,
            image: "bolt.car"
        ),
        
        Question(
            text: "Какую текстуру лучше выбрать для плаката эко-кафе?",
            options: [
                "Глянцевый пластик",
                "Дерево или лен",
                "Ржавый металл",
                "Блестящее стекло"
            ],
            correctAnswer: 1,
            image: "cup.and.saucer"
        ),
        
        Question(
            text: "Какая текстура подойдет для рекламы нового смартфона?",
            options: [
                "Мягкий мех",
                "Шершавый камень",
                "Гладкое, блестящее стекло",
                "Рваная бумага"
            ],
            correctAnswer: 2,
            image: "iphone"
        )
    ]
    
    init() {
        _viewModel = StateObject(wrappedValue: TestViewModel(testId: "formfunc_test", questions: Self.questions))
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
                        Text("Ты прекрасно понял материал про форму и функцию!")
                            .font(.headline)
                            .foregroundStyle(Color.lightBlue)
                            .multilineTextAlignment(.center)
                            .padding()
                    } else {
                        Text("Попробуй ещё раз! Помни: дизайнер — это не художник, а инженер впечатлений!")
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
