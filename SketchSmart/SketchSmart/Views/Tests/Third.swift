//
//  Third.swift
//  SketchSmart
//
//  Created by Елизавета on 29.05.2025.
//

import SwiftUI
import CoreData

struct Third: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel: ThirdModel
    
    init(storage: Storage) {
        _viewModel = StateObject(wrappedValue: ThirdModel(storage: storage))
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
                                Text("1. Дизайнер усовершенствовал маски встроенными наушниками, чтобы жить во времена пандемии было чуть веселее. Рабочее решение?")
                                    .foregroundStyle(.white)
                                
                                Image("Image 20")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(12)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Да, верю, что такие существуют, — а почему нет?", testID: viewModel.testID1)
                                    } label: {
                                        Text("Да, верю, что такие существуют, — а почему нет?")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected1 ?
                                                (viewModel.selectedAnswer1 == "Да, верю, что такие существуют, — а почему нет?" ? .green : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected1)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Выглядит странно — вряд ли это реальный продукт", testID: viewModel.testID1)
                                    } label: {
                                        Text("Выглядит странно — вряд ли это реальный продукт")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected1 ?
                                                (viewModel.selectedAnswer1 == "Выглядит странно — вряд ли это реальный продукт" ? .red : .colorPurple) :
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
                                Text("2. А вот эта штука напоминает крышку от гроба с лампочками. Нашлось ли ей полезное применение?")
                                    .foregroundStyle(.white)
                                
                                Image("Image 21")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Выглядит абсолютно бесполезно", testID: viewModel.testID2)
                                    } label: {
                                        Text("Выглядит абсолютно бесполезно")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Выглядит абсолютно бесполезно" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected2)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Крутая штука, наверняка это кто-нибудь покупает! Хотя бы как арт-объект", testID: viewModel.testID2)
                                    } label: {
                                        Text("Крутая штука, наверняка это кто-нибудь покупает! Хотя бы как арт-объект")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected2 ?
                                                (viewModel.selectedAnswer2 == "Крутая штука, наверняка это кто-нибудь покупает! Хотя бы как арт-объект" ? .green :
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
                                Text("3. Этот робот с шестью щупальцами очень похож на осьминога. Он запущен в производство?")
                                    .foregroundStyle(.white)
                                
                                Image("Image 22")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Да этими щупальцами можно легко вырвать все сорняки! Его однозначно выпустили — дачники к весне раскупят", testID: viewModel.testID3)
                                    } label: {
                                        Text("Да этими щупальцами можно легко вырвать все сорняки! Его однозначно выпустили — дачники к весне раскупят")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected3 ?
                                                (viewModel.selectedAnswer3 == "Да этими щупальцами можно легко вырвать все сорняки! Его однозначно выпустили — дачники к весне раскупят" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected3)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Надеюсь, нет, такой и покалечить может!", testID: viewModel.testID3)
                                    } label: {
                                        Text("Надеюсь, нет, такой и покалечить может!")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected3 ?
                                                (viewModel.selectedAnswer3 == "Надеюсь, нет, такой и покалечить может!" ? .green :
                                                    (viewModel.selectedAnswer3 != viewModel.correctAnswers[viewModel.testID3] ? .colorPurple : .colorPurple)) :
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
                                Text("4. Не выбрасывайте апельсиновые корки — из них промдизайнер может сделать отличную лампу! Ну, наверное. Как думаете, это реальный продукт?")
                                    .foregroundStyle(.white)
                                
                                Image("Image 23")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 335)
                                    .cornerRadius(14)
                                    .padding(.bottom, 10)
                                
                                // Группа кнопок
                                VStack(spacing: 10) {
                                    Button {
                                        viewModel.saveTestResult(answer: "Нет, у апельсинового корпуса был бы слишком короткий срок годности!", testID: viewModel.testID4)
                                    } label: {
                                        Text("Нет, у апельсинового корпуса был бы слишком короткий срок годности!")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected4 ?
                                                (viewModel.selectedAnswer4 == "Нет, у апельсинового корпуса был бы слишком короткий срок годности!" ? .red : .colorPurple) :
                                                        .colorPurple
                                            )
                                            .cornerRadius(16)
                                    }
                                    .disabled(viewModel.isSelected4)
                                    
                                    Button {
                                        viewModel.saveTestResult(answer: "Вполне могу представить лампу из апельсинов на полке — какие проблемы?", testID: viewModel.testID4)
                                    } label: {
                                        Text("Вполне могу представить лампу из апельсинов на полке — какие проблемы?")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(
                                                viewModel.isSelected4 ?
                                                (viewModel.selectedAnswer4 == "Вполне могу представить лампу из апельсинов на полке — какие проблемы?" ? .green :
                                                    (viewModel.selectedAnswer4 != viewModel.correctAnswers[viewModel.testID4] ? .colorPurple : .colorPurple)) :
                                                        .colorPurple
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
            .navigationTitle("Тест прототипы")
        }
    }
}
