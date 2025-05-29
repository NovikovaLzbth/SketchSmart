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
                    //Установка цвета фона
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
                            
                            //Кнопки для перехода к тестам
                            HStack {
                                NavigationLink {
                                    First(storage: viewModel.storage)
                                } label: {
                                    VStack {
                                        Text("Теория цвета")
                                    }
                                    .frame(width: 180, height: 60)
                                }
                                .background(Color.colorPurple)
                                .cornerRadius(16)
                                .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                                
                                NavigationLink {
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
                                NavigationLink {
                                    First(storage: viewModel.storage)
                                } label: {
                                    VStack {
                                        Text("bb")
                                    }
                                    .padding(26)
                                    .padding(.horizontal, 46)
                                }
                                .background(Color.colorPurple)
                                .cornerRadius(16)
                                .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                                
                                NavigationLink {
                                    First(storage: viewModel.storage)
                                } label: {
                                    VStack {
                                        Text("bb")
                                    }
                                    .padding(26)
                                    .padding(.horizontal, 46)
                                }
                                .background(Color.colorPurple)
                                .cornerRadius(16)
                                .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            }
                            .foregroundStyle(.babyYellow)
                        }
                    }
                }
                .navigationTitle("Тренажер")
            }
        }
    }
}

