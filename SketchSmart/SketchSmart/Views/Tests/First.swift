//
//  First.swift
//  SketchSmart
//
//  Created by Елизавета on 22.05.2025.
//

import SwiftUI
import CoreData

struct First: View {
    @StateObject private var viewModel: TestModel
    
    // Состояние кнопки
    @State private var isSelected1 = false
    @State private var isSelected2 = false
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
                                VStack(spacing: 10) { // Вертикальное расположение кнопок
                                    Button {
                                        isSelected1 = true
                                    } label: {
                                        Text("Вторичные")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(isSelected1 ? .red : .colorPurple)
                                            .cornerRadius(16)
                                    }
                                    .disabled(isSelected1)
                                    
                                    Button {
                                        isSelected1 = true
                                    } label: {
                                        Text("Первичные")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(isSelected1 ? .green : .colorPurple)
                                            .cornerRadius(16)
                                    }
                                    .disabled(isSelected1)
                                    
                                    Button {
                                        isSelected1 = true
                                    } label: {
                                        Text("Третичные")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(isSelected1 ? .red : .colorPurple)
                                            .cornerRadius(16)
                                    }
                                    .disabled(isSelected1)
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
                                        isSelected2 = true
                                    } label: {
                                        Text("Сплит-комплиментарный")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(isSelected2 ? .green : .colorPurple)
                                            .cornerRadius(16)
                                    }
                                    .disabled(isSelected2)
                                    
                                    Button {
                                        isSelected2 = true
                                    } label: {
                                        Text("Триадический")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(isSelected2 ? .red : .colorPurple)
                                            .cornerRadius(16)
                                    }
                                    .disabled(isSelected2)
                                    
                                    Button {
                                        isSelected2 = true
                                    } label: {
                                        Text("Комплиментарный")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(isSelected2 ? .red : .colorPurple)
                                            .cornerRadius(16)
                                    }
                                    .disabled(isSelected2)
                                    
                                    Button {
                                        isSelected2 = true
                                    } label: {
                                        Text("Треугольный")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(.white)
                                            .padding(15)
                                            .background(isSelected2 ? .red : .colorPurple)
                                            .cornerRadius(16)
                                    }
                                    .disabled(isSelected2)
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
                        }
                        .padding(.horizontal) // Отступы по бокам для ScrollView
                    }
                }
                
            }
            .navigationTitle("Тест по теории цвета")
        }
    }
}

