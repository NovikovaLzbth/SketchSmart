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
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.babyYellow]
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Color.background.ignoresSafeArea(.all)
                    
                    ScrollView(.vertical) {
                        VStack(spacing: 15) {
                            // Переход на страницу с конкретным материалом о векторе и расте
                            NavigationLink {
                                VectorRast()
                            } label: {
                                VStack {
                                    Text("Вектор и раст")
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(.babyYellow)
                                        .padding(30)
                                }
                            }
                            .background(Color.colorPurple)
                            .cornerRadius(16)
                            .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            
                            // Переход на страницу с конкретным материалом о прототипировании
                            NavigationLink {
                                Prototype()
                            } label: {
                                VStack {
                                    Text("Прототипирование")
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(.babyYellow)
                                        .padding(30)
                                }
                            }
                            .background(Color.colorPurple)
                            .cornerRadius(16)
                            .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            
                            // Переход на страницу с конкретным материалом о психологии в UX/UI
                            NavigationLink {
                                Psychology()
                            } label: {
                                VStack {
                                    Text("Психология в UX/UI")
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(.babyYellow)
                                        .padding(30)
                                }
                            }
                            .background(Color.colorPurple)
                            .cornerRadius(16)
                            .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            
                            // Переход на страницу с конкретным материалом о теории цвета
                            NavigationLink {
                                ColorTeory()
                            } label: {
                                VStack {
                                    Text("Теория цвета как основа для дизайна")
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(.babyYellow)
                                        .padding(30)
                                }
                            }
                            .background(Color.colorPurple)
                            .cornerRadius(16)
                            .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            
                            // Переход на страницу с видео уроком
                            NavigationLink {
                                RutubeVideoView(videoURL: "https://rutube.ru/video/ece3e001546458cf1bd2ce83c122fa81/")
                                    .ignoresSafeArea(.all)
                            } label: {
                                VStack {
                                    Text("видео rutube")
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(.babyYellow)
                                        .padding(30)
                                }
                            }
                            .background(Color.colorPurple)
                            .cornerRadius(16)
                            .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            
                            NavigationLink {
                                VideoFirst()
                                    .ignoresSafeArea(.all)
                            } label: {
                                VStack {
                                    Text("видео GitHub")
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(.babyYellow)
                                        .padding(30)
                                }
                            }
                            .background(Color.colorPurple)
                            .cornerRadius(16)
                            .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
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
