//
//  MainView.swift
//  SketchSmart
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI
import CoreData

struct MainView: View {
    
    init() {
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
                            .background(Color.turquoise)
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
                            .background(Color.turquoise)
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
                        .foregroundStyle(.turquoise)
                        
                        HStack {
                            NavigationLink {
                                Pls()
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
                                Pls()
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
                        .foregroundStyle(.turquoise)
                    }
                    .frame(maxWidth: .infinity) // Занимает всю ширину
                    .padding() // Добавляет отступы только для контента
                }
            }
            .navigationTitle("Проверь себя!")
        }
    }
}

