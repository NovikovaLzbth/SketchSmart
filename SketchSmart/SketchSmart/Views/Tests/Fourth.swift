//
//  Fourth.swift
//  SketchSmart
//
//  Created by Елизавета on 29.05.2025.
//

import SwiftUI
import CoreData
import AVFoundation

struct Fourth: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel: FourthModel
    
    init(storage: Storage) {
        _viewModel = StateObject(wrappedValue: FourthModel(storage: storage))
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
                                Text("1. Какой цвет чаще всего ассоциируется с доверием и спокойствием?")
                                    .foregroundStyle(.white)
                                
                                Image("Image 24")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(12)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Красный", testID: viewModel.testID1)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Красный")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected1 ?
                                                (viewModel.selectedAnswer1 == "Красный" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected1)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Синий", testID: viewModel.testID1)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Синий")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected1 ?
                                                (viewModel.selectedAnswer1 == "Синий" ? .green : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected1)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Желтый", testID: viewModel.testID1)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Желтый")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected1 ?
                                                (viewModel.selectedAnswer1 == "Желтый" ? .red : .colorPurple) :
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
                                Text("2. Какая форма визуально воспринимается как наиболее стабильная?")
                                    .foregroundStyle(.white)
                                
                                Image("Image 25")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Треугольник", testID: viewModel.testID2)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Треугольник")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Треугольник" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected2)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Круг", testID: viewModel.testID2)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Круг")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Круг" ? .green :
                                                    (viewModel.selectedAnswer2 != viewModel.correctAnswers[viewModel.testID2] ? .colorPurple : .colorPurple)) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected2)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Квадрат", testID: viewModel.testID2)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Квадрат")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Квадрат" ? .green :
                                                    (viewModel.selectedAnswer2 != viewModel.correctAnswers[viewModel.testID2] ? .colorPurple : .colorPurple)) :
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
                                Text("3. Какой принцип гештальта объясняет, что люди склонны объединять близко расположенные элементы?")
                                    .foregroundStyle(.white)
                                
                                Image("Image 26")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Замкнутость", testID: viewModel.testID3)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Замкнутость")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected3 ?
                                                (viewModel.selectedAnswer3 == "Замкнутость" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected3)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Близость", testID: viewModel.testID3)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Близость")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected3 ?
                                                (viewModel.selectedAnswer3 == "Близость" ? .green :
                                                    (viewModel.selectedAnswer3 != viewModel.correctAnswers[viewModel.testID3] ? .colorPurple : .colorPurple)) :
                                                        .colorPurple
                                            )
                                            
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected3)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Сходство", testID: viewModel.testID3)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Сходство")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected3 ?
                                                (viewModel.selectedAnswer3 == "Сходство" ? .red : .colorPurple) :
                                                        .colorPurple
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
                                Text("4. Какая композиция создает ощущение динамики?")
                                    .foregroundStyle(.white)
                                
                                Image("Image 27")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Симметричная", testID: viewModel.testID4)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Симметричная")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected4 ?
                                                (viewModel.selectedAnswer4 == "Симметричная" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected4)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Диагональная", testID: viewModel.testID4)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Диагональная")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected4 ?
                                                (viewModel.selectedAnswer4 == "Диагональная" ? .green :
                                                    (viewModel.selectedAnswer4 != viewModel.correctAnswers[viewModel.testID4] ? .colorPurple : .colorPurple)) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected4)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Центрированная", testID: viewModel.testID4)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Центрированная")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected4 ?
                                                (viewModel.selectedAnswer4 == "Центрированная" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected4)
                                }
                            }
                            .padding()
                            .cornerRadius(12)
                            
                            // Вопрос 5
                            VStack(alignment: .leading, spacing: 10) {
                                Text("5. Какой эффект вызывает избыток красного в дизайне?")
                                    .foregroundStyle(.white)
                                
                                Image("Image 28")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Расслабление", testID: viewModel.testID5)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Расслабление")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected5 ?
                                                (viewModel.selectedAnswer5 == "Расслабление" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected5)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Нейтральность", testID: viewModel.testID5)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Нейтральность")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected5 ?
                                                (viewModel.selectedAnswer5 == "Нейтральность" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected5)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Агрессию или тревогу", testID: viewModel.testID5)
                                        
                                        AudioServicesPlaySystemSound(1519)
                                    } label: {
                                        Text("Агрессию или тревогу")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected5 ?
                                                (viewModel.selectedAnswer5 == "Агрессию или тревогу" ? .green :
                                                    (viewModel.selectedAnswer5 != viewModel.correctAnswers[viewModel.testID5] ? .colorPurple : .colorPurple)) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected5)
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
            .navigationTitle("Тест прототипы")
        }
    }
}
