//
//  First.swift
//  SketchSmart
//
//  Created by Елизавета on 22.05.2025.
//

import SwiftUI
import CoreData

struct First: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel: TestModel
    
    // Состояние кнопки
    @State private var isSelected3 = false
    
    init(storage: Storage) {
        _viewModel = StateObject(wrappedValue: TestModel(storage: storage))
        
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
                                Text("1. К какой группе относится цвет на картинке?")
                                    .foregroundStyle(.white)
                                
                                Image("Image 13")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Вторичные", testID: viewModel.testID1)
                                    } label: {
                                        Text("Вторичные")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected1 ?
                                                (viewModel.selectedAnswer1 == "Вторичные" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected1)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Первичные", testID: viewModel.testID1)
                                    } label: {
                                        Text("Первичные")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected1 ?
                                                (viewModel.selectedAnswer1 == "Первичные" ? .green : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected1)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Третичные", testID: viewModel.testID1)
                                    } label: {
                                        Text("Третичные")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected1 ?
                                                (viewModel.selectedAnswer1 == "Третичные" ? .red : .colorPurple) :
                                                        .colorPurple
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
                                Text("2. Какой способ сочетания цветов на картинке?")
                                    .foregroundStyle(.white)
                                
                                Image("Image 14")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Сплит-комплиментарный", testID: viewModel.testID2)
                                    } label: {
                                        Text("Сплит-комплиментарный")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Сплит-комплиментарный" ? .green :
                                                    (viewModel.selectedAnswer2 != viewModel.correctAnswers[viewModel.testID2] ? .colorPurple : .colorPurple)) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected2)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Триадический", testID: viewModel.testID2)
                                    } label: {
                                        Text("Триадический")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Триадический" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected2)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Комплиментарный", testID: viewModel.testID2)
                                    } label: {
                                        Text("Комплиментарный")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Комплиментарный" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected2)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Треугольный", testID: viewModel.testID2)
                                    } label: {
                                        Text("Треугольный")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Треугольный" ? .red : .colorPurple) :
                                                        .colorPurple
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
                                Text("3. Какой способ сочетания цветов на картинке?")
                                    .foregroundStyle(.white)
                                
                                Image("Image 15")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        isSelected3 = true
                                    } label: {
                                        Text("Хроматический")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(isSelected3 ? .red : .colorPurple)
                                            .cornerRadius(16)
                                    }
                                    .disabled(isSelected3)
                                    
                                    Button {
                                        isSelected3 = true
                                    } label: {
                                        Text("Единоцветный")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(isSelected3 ? .red : .colorPurple)
                                            .cornerRadius(16)
                                    }
                                    .disabled(isSelected3)
                                    
                                    Button {
                                        isSelected3 = true
                                    } label: {
                                        Text("Монохроматический")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(isSelected3 ? .green : .colorPurple)
                                            .cornerRadius(16)
                                    }
                                    .disabled(isSelected3)
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
            .navigationTitle("Тест по теории цвета")
        }
    }
}

