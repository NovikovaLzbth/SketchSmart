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
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.darkBlue]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(spacing: 15) {
                        VStack {
                            NavigationLink {
                                GameView()
                            } label: {
                                VStack {
                                    Label("Игра для цветовосприятия", systemImage: "gamecontroller.fill")
                                        .foregroundColor(.background)
                                }
                                .frame(width: 360, height: 70)
                            }
                            .background(Color.babyYellow)
                            .cornerRadius(20)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                        }
                        .foregroundStyle(.darkBlue)
                        
                        VStack {
                            NavigationLink {
                                MemoryPaletteGameView()
                            } label: {
                                VStack {
                                    Label("Палитра памяти", systemImage: "gamecontroller.fill")
                                        .foregroundColor(.background)
                                }
                                .frame(width: 360, height: 70)
                            }
                            .background(Color.babyYellow)
                            .cornerRadius(20)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                        }
                        .foregroundStyle(.darkBlue)
                        .padding(.bottom, 20)
                        
                        HStack {
                            NavigationLink {
                                Pls()
                            } label: {
                                VStack {
                                    Text("Точка, линия, пятно")
                                        .foregroundColor(.background)
                                }
                                .frame(width: 175, height: 60)
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(20)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                            
                            NavigationLink {
                                Rnbw()
                            } label: {
                                VStack {
                                    Text("Радуга-помощница")
                                        .foregroundColor(.background)
                                }
                                .frame(width: 175, height: 60)
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(20)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                        }
                        .foregroundStyle(.babyYellow)
                        
                        HStack {
                            NavigationLink {
                                Third(storage: viewModel.storage)
                            } label: {
                                VStack {
                                    Text("Прототипирование")
                                        .foregroundColor(.background)
                                }
                                .frame(width: 175, height: 60)
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(20)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                            
                            NavigationLink {
                                Fourth(storage: viewModel.storage)
                            } label: {
                                VStack {
                                    Text("Психология в UI/UX")
                                        .foregroundColor(.background)
                                }
                                .frame(width: 175, height: 60)
                            }
                            .background(Color.lightBlue)
                            .cornerRadius(20)
                            .shadow(color: .darkBlue, radius: 5, x: 5, y: 4)
                        }
                        .foregroundStyle(.babyYellow)
                    }
                    .frame(maxWidth: .infinity) // Занимает всю ширину
                    .padding() // Добавляет отступы только для контента
                }
            }
            .navigationTitle("Проверь себя!")
        }
    }
}

