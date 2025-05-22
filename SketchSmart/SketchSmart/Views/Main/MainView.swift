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
                        //Кнопки для перехода к тестам
                        VStack {
                            HStack {
                                NavigationLink {
                                    First(storage: viewModel.storage)
                                } label: {
                                    VStack {
                                        Text("bb")
                                    }
                                }
                                .padding(26)
                                .padding(.horizontal, 46)
                                .background(Color.colorPurple)
                                .cornerRadius(16)
                                .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                                
                                NavigationLink {
                                    First(storage: viewModel.storage)
                                } label: {
                                    VStack {
                                        Text("bb")
                                    }
                                }
                                .padding(26)
                                .padding(.horizontal, 46)
                                .background(Color.colorPurple)
                                .cornerRadius(16)
                                .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            }
                            
                            HStack {
                                NavigationLink {
                                    First(storage: viewModel.storage)
                                } label: {
                                    VStack {
                                        Text("bb")
                                    }
                                }
                                .padding(26)
                                .padding(.horizontal, 46)
                                .background(Color.colorPurple)
                                .cornerRadius(16)
                                .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                                
                                NavigationLink {
                                    First(storage: viewModel.storage)
                                } label: {
                                    VStack {
                                        Text("bb")
                                    }
                                }
                                .padding(26)
                                .padding(.horizontal, 46)
                                .background(Color.colorPurple)
                                .cornerRadius(16)
                                .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            }
                        }
                    }
                }
                .navigationTitle("Тренажер")
            }
        }
    }
}

