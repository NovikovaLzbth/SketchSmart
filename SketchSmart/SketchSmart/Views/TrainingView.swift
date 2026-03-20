//
//  TrainingView.swift
//  SketchSmart
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI
import CoreData

struct TrainingView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.darkBlue]
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Color.background.ignoresSafeArea(.all)
                    
                    ScrollView(.vertical) {
                        VStack(spacing: 15) {
                            // Введение
                            NavigationLink {
                                Introduction()
                            } label: {
                                VStack {
                                    Text("Введение")
                                        .frame(maxWidth: .infinity)
                                        .font(.title2.bold())
                                        .foregroundStyle(Color.background)
                                        .padding(30)
                                }
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(23)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                            
                            // Переход на страницу с конкретным материалом о векторе и расте
                            NavigationLink {
                                PointLineStain()
                            } label: {
                                VStack {
                                    Text("Точка, линия, пятно")
                                        .frame(maxWidth: .infinity)
                                        .font(.title2.bold())
                                        .foregroundStyle(Color.background)
                                        .padding(30)
                                }
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(23)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                            
                            // Переход на страницу с конкретным материалом о прототипировании
                            NavigationLink {
                                Rainbow()
                            } label: {
                                VStack {
                                    Text("Радуга-помощница")
                                        .frame(maxWidth: .infinity)
                                        .font(.title2.bold())
                                        .foregroundStyle(Color.background)
                                        .padding(30)
                                }
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(23)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                            
                            NavigationLink {
                                Typography()
                            } label: {
                                VStack {
                                    Text("Типографика")
                                        .frame(maxWidth: .infinity)
                                        .font(.title2.bold())
                                        .foregroundStyle(Color.background)
                                        .padding(30)
                                }
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(23)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                            
                            NavigationLink {
                                Composition()
                            } label: {
                                VStack {
                                    Text("Композиция")
                                        .frame(maxWidth: .infinity)
                                        .font(.title2.bold())
                                        .foregroundStyle(Color.background)
                                        .padding(30)
                                }
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(23)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                            
                            NavigationLink {
                                GrRhAccent()
                            } label: {
                                VStack {
                                    Text("Сетка, Ритм, Акцент")
                                        .frame(maxWidth: .infinity)
                                        .font(.title2.bold())
                                        .foregroundStyle(Color.background)
                                        .padding(30)
                                }
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(23)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                            
                            NavigationLink {
                                Idea()
                            } label: {
                                VStack {
                                    Text("Идея и Эмоция")
                                        .frame(maxWidth: .infinity)
                                        .font(.title2.bold())
                                        .foregroundStyle(Color.background)
                                        .padding(30)
                                }
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(23)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                            
                            NavigationLink {
                                FormFunction()
                            } label: {
                                VStack {
                                    Text("Форма и функция")
                                        .frame(maxWidth: .infinity)
                                        .font(.title2.bold())
                                        .foregroundStyle(Color.background)
                                        .padding(30)
                                }
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(23)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                            
                            NavigationLink {
                                DesignThinking()
                            } label: {
                                VStack {
                                    Text("Дизайн-мышление")
                                        .frame(maxWidth: .infinity)
                                        .font(.title2.bold())
                                        .foregroundStyle(Color.background)
                                        .padding(30)
                                }
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(23)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                        }
                        .padding()
                    }
                }
                // Заголовок
                .navigationTitle("Обучение")
            }
        }
    }
}
