//
//  Second.swift
//  SketchSmart
//
//  Created by Елизавета on 28.05.2025.
//

import SwiftUI
import CoreData

struct Second: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel: SecondModel
    
    init(storage: Storage) {
        _viewModel = StateObject(wrappedValue: SecondModel(storage: storage))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    //Установка цвета фона
                    Color.background.ignoresSafeArea(.all)
                    
                    ScrollView(.vertical) {
                        VStack(spacing: 20) { // Увеличение расстояния между вопросами
                            // Вопрос 1
                            VStack(alignment: .leading, spacing: 10) {
                                Text(String(localized: "rast", table: "Localizable"))
                                    .foregroundStyle(.white)
                                
                                Image("Image 16")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(12)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Пикселей", testID: viewModel.testID1)
                                    } label: {
                                        Text("Пикселей")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected1 ?
                                                (viewModel.selectedAnswer1 == "Пикселей" ? .green : .lightBlue) :
                                                        .lightBlue
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected1)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Примитивов (фигур)", testID: viewModel.testID1)
                                    } label: {
                                        Text("Примитивов (фигур)")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected1 ?
                                                (viewModel.selectedAnswer1 == "Примитивов (фигур)" ? .red : .lightBlue) :
                                                        .lightBlue
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected1)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Линий", testID: viewModel.testID1)
                                    } label: {
                                        Text("Линий")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected1 ?
                                                (viewModel.selectedAnswer1 == "Линий" ? .red : .lightBlue) :
                                                        .lightBlue
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected1)
                                }
                            }
                            .padding()
                            .cornerRadius(12)
                            
                            // Вопрос 2
                            VStack(alignment: .leading, spacing: 10) {
                                Text(String(localized: "test22", table: "Localizable"))
                                    .foregroundStyle(.white)
                                
                                Image("Image 17")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Количества цветов в палитре", testID: viewModel.testID2)
                                    } label: {
                                        Text("Количества цветов в палитре")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Количества цветов в палитре" ? .red : .lightBlue) :
                                                        .lightBlue
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected2)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Количества используемых объектов в рисунке", testID: viewModel.testID2)
                                    } label: {
                                        Text("Количества используемых объектов в рисунке")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Количества используемых объектов в рисунке" ? .red : .lightBlue) :
                                                        .lightBlue
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected2)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Пространственного разрешения", testID: viewModel.testID2)
                                    } label: {
                                        Text("Пространственного разрешения")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Пространственного разрешения" ? .green :
                                                    (viewModel.selectedAnswer2 != viewModel.correctAnswers[viewModel.testID2] ? .lightBlue : .lightBlue)) :
                                                        .lightBlue
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected2)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Все вышеперечисленные ответы", testID: viewModel.testID2)
                                    } label: {
                                        Text("Все вышеперечисленные ответы")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Все вышеперечисленные ответы" ? .red : .lightBlue) :
                                                        .lightBlue
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected2)
                                }
                            }
                            .padding()
                            .cornerRadius(12)
                            
                            // Вопрос 3
                            VStack(alignment: .leading, spacing: 10) {
                                Text(String(localized: "test23", table: "Localizable"))
                                    .foregroundStyle(.white)
                                
                                Image("Image 18")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Пикселей", testID: viewModel.testID3)
                                    } label: {
                                        Text("Пикселей")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected3 ?
                                                (viewModel.selectedAnswer3 == "Пикселей" ? .red : .lightBlue) :
                                                        .lightBlue
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected3)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Примитивов (фигур)", testID: viewModel.testID3)
                                    } label: {
                                        Text("Примитивов (фигур)")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected3 ?
                                                (viewModel.selectedAnswer3 == "Примитивов (фигур)" ? .green :
                                                    (viewModel.selectedAnswer3 != viewModel.correctAnswers[viewModel.testID3] ? .lightBlue : .lightBlue)) :
                                                        .lightBlue
                                            )
                                            
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected3)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Символов", testID: viewModel.testID3)
                                    } label: {
                                        Text("Символов")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected3 ?
                                                (viewModel.selectedAnswer3 == "Символов" ? .red : .lightBlue) :
                                                        .lightBlue
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected3)
                                }
                            }
                            .padding()
                            .cornerRadius(12)
                            
                            // Вопрос 4
                            VStack(alignment: .leading, spacing: 10) {
                                Text(String(localized: "test24", table: "Localizable"))
                                    .foregroundStyle(.white)
                                
                                Image("Image 19")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Графический редактор", testID: viewModel.testID4)
                                    } label: {
                                        Text("Графический редактор")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected4 ?
                                                (viewModel.selectedAnswer4 == "Графический редактор" ? .green :
                                                    (viewModel.selectedAnswer4 != viewModel.correctAnswers[viewModel.testID4] ? .lightBlue : .lightBlue)) :
                                                        .lightBlue
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected4)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Текстовый редактор", testID: viewModel.testID4)
                                    } label: {
                                        Text("Текстовый редактор")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                        
                                        .background(
                                            viewModel.isSelected4 ?
                                            (viewModel.selectedAnswer4 == "Текстовый редактор" ? .red : .lightBlue) :
                                                    .lightBlue
                                        )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected4)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Нет правильного ответа", testID: viewModel.testID4)
                                    } label: {
                                        Text("Нет правильного ответа")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected4 ?
                                                (viewModel.selectedAnswer4 == "Нет правильного ответа" ? .red : .lightBlue) :
                                                        .lightBlue
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected4)
                                }
                            }
                            .padding()
                            .cornerRadius(12)
                            
                            // Отображение статистики
                            VStack {
                                Text("Правильных ответов: \(viewModel.correctAnswersCount)")
                                    .foregroundStyle(.green)
                                Text("Ошибок: \(viewModel.wrongAnswersCount)")
                                    .foregroundStyle(.red)
                            }
                            .padding()
                            
                            Button {
                                // Выход с экрана при нажатии кнопки "Пройти заново"
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Label("Пройти заново", systemImage: "arrow.trianglehead.clockwise")
                                    .foregroundStyle(.babyYellow)
                                    .padding()
                            }
                            
                        }
                        .padding(.horizontal) // Отступы по бокам для ScrollView
                    }
                }
                
            }
            .navigationTitle("Тест вектор и раст")
        }
    }
}
