//
//  ContentView.swift
//  SketchSmart
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var viewModel: ContentViewModel
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("Тренажер")
                }
            
            TrainingView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Обучение")
                }
            
            Profile(viewModel: ProfileViewModel(profile: UserModel(id: "",
                                                                     name: "",
                                                                     phone: "",
                                                                     email: "")))
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Профиль")
                }
        }
        .tint(.lightBlue) // Цвет акцента TabBar
        .onAppear {
            // Настройка внешнего вида TabBar
            let appearance = UITabBarAppearance()
            
            // Цвет фона TabBar
            appearance.backgroundColor = UIColor(Color.lightBlue)
            
            // Цвет неподсвеченных иконок и текста
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.darkBlue.opacity(0.7))
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                .foregroundColor: UIColor(Color.darkBlue.opacity(0.7))
            ]
            
            // Примение настройки
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}
