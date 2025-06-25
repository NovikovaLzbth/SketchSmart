//
//  MainView.swift
//  SketchSmart
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI
import CoreData

struct MainView: View {
    @StateObject private var viewModel: MainViewModel
    
    init(storage: Storage) {
        _viewModel = StateObject(wrappedValue: MainViewModel(storage: storage))
        //Смена цвета заголовка
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.babyYellow]
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Color.background.ignoresSafeArea(.all)
                    
                    ScrollView(.vertical) {
                        VStack {
                            ZStack {
                                Image("Image 12")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 350)
                                    .cornerRadius(14)
                                    .padding(.bottom)
                                    .shadow(color: .darkPurple, radius: 10)
                            }
                            .padding(.horizontal, 1)
                            .foregroundStyle(.white)
                            
                            VStack {
                                NavigationLink {
                                    GameView()
                                } label: {
                                    VStack {
                                        Label("Игра для цветовосприятия", systemImage: "gamecontroller.fill")
                                    }
                                    .frame(width: 365, height: 60)
                                }
                                .background(Color.babyYellow)
                                .cornerRadius(16)
                                .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            }
                            .foregroundStyle(.darkPurple)
                            .padding(.bottom, 20)
                            
                            HStack {
                                NavigationLink {
                                    First()
                                } label: {
                                    VStack {
                                        Text("Теория цвета")
                                    }
                                    .frame(width: 180, height: 60)
                                }
                                // Модификаторы для кнопки перехода
                                .background(Color.colorPurple)
                                .cornerRadius(16)
                                .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                                
                                NavigationLink {
                                    // Переход на тест по расту и вектору 
                                    Second(storage: viewModel.storage)
                                } label: {
                                    VStack {
                                        Text("Вектор и раст")
                                    }
                                    .frame(width: 180, height: 60)
                                }
                                .background(Color.colorPurple)
                                .cornerRadius(16)
                                .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            }
                            .foregroundStyle(.babyYellow)
                            
                            HStack {
                                // Переход на тест по прототипированию
                                NavigationLink {
                                    Third(storage: viewModel.storage)
                                } label: {
                                    VStack {
                                        Text("Прототипирование")
                                    }
                                    .frame(width: 180, height: 60)
                                }
                                .background(Color.colorPurple)
                                .cornerRadius(16)
                                .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                                
                                NavigationLink {
                                    Fourth(storage: viewModel.storage)
                                } label: {
                                    VStack {
                                        Text("Психология в UI/UX")
                                    }
                                    .frame(width: 180, height: 60)
                                }
                                .background(Color.colorPurple)
                                .cornerRadius(16)
                                .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            }
                            .foregroundStyle(.babyYellow)
                        }
                    }
                }
                // Заголовок
                .navigationTitle("Тренажер")
            }
        }
    }
}

