import SwiftUI

struct Pls: View {
    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var showResults = false
    @State private var selectedAnswer: Int?
    @State private var isAnswerCorrect = false
    @State private var showFeedback = false
    
    let questions = [
        Question(
            text: "Что такое ТОЧКА в рисунке?",
            options: [
                "Это начало всего, как след от карандаша",
                "Это всегда маленький кружок",
                "Это только начало букв",
                "Это ошибка в рисунке"
            ],
            correctAnswer: 0,
            image: "circle.fill"
        ),
        Question(
            text: "Что можно создать из множества точек?",
            options: [
                "Только цифры и буквы",
                "Текстуру",
                "Только контуры предметов",
                "Только прямые линии"
            ],
            correctAnswer: 1,
            image: "circle.grid.3x3.fill"
        ),
        Question(
            text: "Линия — это...",
            options: [
                "Всегда прямая черта",
                "Бегущая точка",
                "Только граница предмета",
                "Всегда невидимая"
            ],
            correctAnswer: 1,
            image: "line.diagonal"
        ),
        Question(
            text: "Что показывает линия кроме контура?",
            options: [
                "Только размер",
                "Только цвет",
                "Движение предмета",
                "Только форму"
            ],
            correctAnswer: 2,
            image: "arrow.right.circle.fill"
        ),
        Question(
            text: "Как получается фигура (пятно)?",
            options: [
                "Когда соединяются разные цвета",
                "Когда линия встречается сама с собой",
                "Когда рисуешь без отрыва руки",
                "Когда смешиваются краски"
            ],
            correctAnswer: 1,
            image: "square.fill"
        ),
        Question(
            text: "Из чего можно собрать домик?",
            options: [
                "Из кругов и овалов",
                "Из квадрата и треугольника",
                "Только из прямых линий",
                "Только из точек"
            ],
            correctAnswer: 1,
            image: "house.fill"
        ),
        Question(
            text: "Солнце можно нарисовать из:",
            options: [
                "Квадрата и линий",
                "Треугольников",
                "Круга и лучей-линий",
                "Только из точек"
            ],
            correctAnswer: 2,
            image: "sun.max.fill"
        ),
        Question(
            text: "Что такое КОНТУР?",
            options: [
                "Центр рисунка",
                "Линия, которая обводит предмет",
                "Тень от предмета",
                "Фон рисунка"
            ],
            correctAnswer: 1,
            image: "scribble"
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
                            .foregroundColor(.turquoise)
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
                            .foregroundColor(.turquoise)
                        
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
                                HStack {
                                    Text(questions[currentQuestion].options[index])
                                        .font(.body)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(.darkBlue)
                                    
                                    Spacer()
                                    
                                    if showFeedback && selectedAnswer == index {
                                        Image(systemName: isAnswerCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                            .foregroundColor(isAnswerCorrect ? .green : .red)
                                    }
                                }
                                .padding()
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
                                    .fill(index < score ? Color.turquoise : Color.gray.opacity(0.3))
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
