import SwiftUI

struct Rnbw: View {
    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var showResults = false
    @State private var selectedAnswer: Int?
    @State private var isAnswerCorrect = false
    @State private var showFeedback = false
    
    let questions = [
        Question(
            text: "Какие цвета называют «Волшебной троицей»?",
            options: [
                "Оранжевый, Зеленый, Фиолетовый",
                "Красный, Желтый, Синий",
                "Белый, Черный, Серый",
                "Розовый, Голубой, Коричневый"
            ],
            correctAnswer: 1,
            image: "paintpalette.fill"
        ),
        Question(
            text: "Почему эти три цвета главные?",
            options: [
                "Они самые яркие",
                "Их любят короли и королевы",
                "Их нельзя получить путем смешивания других красок",
                "Они есть в каждом рисунке"
            ],
            correctAnswer: 2,
            image: "flask.fill"
        ),
        Question(
            text: "Синий + красный = ... ?",
            options: [
                "Бордовый",
                "Фиолетовый",
                "Оранжевый",
                "Зеленый"
            ],
            correctAnswer: 1,
            image: "circle.dashed.rectangle"
        ),
        Question(
            text: "Цвета, смешанные из основных - ...",
            options: [
                "Второстепенные",
                "Составные",
                "Простые",
                "Холодные"
            ],
            correctAnswer: 1,
            image: "puzzlepiece.extension.fill"
        ),
        Question(
            text: "Какая палитра относится к «Теплой»?",
            options: [
                "Синий, голубой, фиолетовый",
                "Красный, оранжевый, желтый",
                "Зеленый, коричневый, черный",
                "Серый, белый, бежевый"
            ],
            correctAnswer: 1,
            image: "sun.max.fill"
        ),
        Question(
            text: "С чем сравнивают холодные цвета в тексте?",
            options: [
                "Костер и Солнце",
                "Осень и Урожай",
                "Море и Лед",
                "Песок и Глина"
            ],
            correctAnswer: 2,
            image: "snowflake"
        ),
        Question(
            text: "Что такое ГАРМОНИЯ в мире цвета?",
            options: [
                "Драка и конкуренция",
                "Дружба и родство",
                "Смешивание до грязного цвета",
                "Отсутствие цвета"
            ],
            correctAnswer: 1,
            image: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left"
        )
    ]
    
    struct Question {
        let text: String
        let options: [String]
        let correctAnswer: Int
        let image: String
    }
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            if !showResults {
                VStack(spacing: 20) {
                    // Прогресс
                    HStack {
                        Text("Вопрос \(currentQuestion + 1)/\(questions.count)")
                            .font(.headline)
                            .foregroundColor(.lightBlue)
                        
                        Spacer()
                        
                        Text("Очки: \(score)")
                            .font(.headline)
                            .foregroundColor(.babyYellow)
                    }
                    .padding(.horizontal)
                    
                    // Индикатор прогресса
                    ProgressView(value: Double(currentQuestion + 1), total: Double(questions.count))
                        .progressViewStyle(LinearProgressViewStyle(tint: .lightBlue))
                        .padding(.horizontal)
                    
                    // Вопрос с иконкой
                    VStack(spacing: 15) {
                        Image(systemName: questions[currentQuestion].image)
                            .font(.system(size: 50))
                            .foregroundColor(.babyYellow)
                        
                        Text(questions[currentQuestion].text)
                            .font(.title2)
                            .foregroundStyle(.darkBlue)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding(.vertical, 30)
                    
                    // Варианты ответов
                    VStack(spacing: 12) {
                        ForEach(0..<questions[currentQuestion].options.count, id: \.self) { index in
                            Button(action: {
                                checkAnswer(index)
                            }) {
                                HStack(alignment: .top) { // Добавлено выравнивание по верхнему краю
                                    Text(questions[currentQuestion].options[index])
                                        .font(.body)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(.darkBlue)
                                        .fixedSize(horizontal: false, vertical: true) // Разрешаем многострочность
                                    
                                    Spacer(minLength: 8) // Минимальный отступ для иконки
                                    
                                    if showFeedback && selectedAnswer == index {
                                        Image(systemName: isAnswerCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                            .foregroundColor(isAnswerCorrect ? .green : .red)
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading) // Растягиваем на всю ширину
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(
                                            selectedAnswer == index ?
                                            (isAnswerCorrect ? Color.green.opacity(0.2) : Color.red.opacity(0.2)) :
                                            Color.gray.opacity(0.1)
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(
                                                    selectedAnswer == index ?
                                                    (isAnswerCorrect ? Color.green : Color.red) :
                                                        Color.lightGray,
                                                    lineWidth: 2
                                                )
                                        )
                                )
                            }
                            .disabled(showFeedback)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // Кнопка продолжения
                    if showFeedback {
                        Button(action: nextQuestion) {
                            Text(currentQuestion < questions.count - 1 ? "Следующий вопрос" : "Узнать результат")
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
                    Image(systemName: score >= questions.count / 2 ? "trophy.fill" : "lightbulb.fill")
                        .font(.system(size: 70))
                        .foregroundColor(score >= questions.count / 2 ? .yellow : .orange)
                    
                    Text(score >= questions.count / 2 ? "Отлично!" : "Не время сдаваться!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.darkBlue)
                    
                    // Шкала результата
                    VStack(spacing: 10) {
                        Text("Твой уровень:")
                            .font(.headline)
                            .foregroundStyle(Color.darkBlue)
                        
                        HStack {
                            ForEach(0..<questions.count, id: \.self) { index in
                                Rectangle()
                                    .fill(index < score ? Color.babyYellow : Color.gray.opacity(0.3))
                                    .frame(height: 20)
                                    .cornerRadius(5)
                            }
                        }
                    }
                    .padding()
                    
                    if score >= questions.count / 2 {
                        Text("Ты отлично понял основы рисунка!")
                            .font(.headline)
                            .foregroundStyle(Color.lightBlue)
                            .multilineTextAlignment(.center)
                            .padding()
                    } else {
                        Text("Попробуй ещё раз! Помни: все рисунки собираются из точек, линий и фигур!")
                            .font(.headline)
                            .foregroundColor(.lightBlue)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                    Button(action: {
                        resetTest()
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
        .animation(.spring(response: 0.2), value: showFeedback)
        .animation(.spring(response: 0.2), value: showResults)
    }
    
    func checkAnswer(_ index: Int) {
        selectedAnswer = index
        isAnswerCorrect = index == questions[currentQuestion].correctAnswer
        
        if isAnswerCorrect {
            score += 1
        }
        
        showFeedback = true
    }
    
    func nextQuestion() {
        if currentQuestion < questions.count - 1 {
            currentQuestion += 1
            selectedAnswer = nil
            showFeedback = false
        } else {
            showResults = true
        }
    }
    
    func resetTest() {
        currentQuestion = 0
        score = 0
        selectedAnswer = nil
        showResults = false
        showFeedback = false
    }
}

#Preview {
    Pls()
}
