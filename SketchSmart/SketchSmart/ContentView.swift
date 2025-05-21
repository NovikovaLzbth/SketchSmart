//
//  ContentView.swift
//  SketchSmart
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject private var storage: Storage
    
    @State var selectedTab = "Тренажер"
    
    let tabs = ["Тренажер", "Обучение"]
    
    //Сокрытие TabBar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                MainView(storage: storage)
                    .tag("Тренажер")
                TrainingView(storage: storage)
                    .tag("Обучение")
            }
            
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    TabBarItem(tab: tab, selected: $selectedTab)
                }
            }
        }
        .background(Color.background)
    }
}

//структура для кастома TabBar
struct TabBarItem: View {
    @State var tab: String
    
    @Binding var selected: String
    
    var body: some View {
        ZStack {
            Button {
                withAnimation(.bouncy()) {
                    selected = tab
                }
            } label: {
                Image(tab)
                    .resizable()
                    .frame(width: 32, height: 32)
                if selected == tab {
                    Text(tab)
                        .font(.system(size: 16))
                        .foregroundStyle(Color.black)
                }
            }
        }
        .opacity(selected == tab ? 1 : 0.7)
        .padding(.horizontal, 10)
        .padding(.vertical, 12)
        .background(selected == tab ? .babyYellow : .colorPurple)
        .clipShape(Capsule())
    }
}
