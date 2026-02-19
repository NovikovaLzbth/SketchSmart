//
//  TrainingView.swift
//  SketchSmart
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI
import CoreData

struct TrainingView: View {
    @StateObject var viewModel: TrainingViewModel
    
    init(storage: Storage) {
        _viewModel = StateObject(wrappedValue: TrainingViewModel(storage: storage))
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
                            
                            // Переход на страницу с конкретным материалом о психологии в UX/UI
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
                            
                            // Переход на страницу с конкретным материалом о теории цвета
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
