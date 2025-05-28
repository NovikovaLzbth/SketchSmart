//
//  Second.swift
//  SketchSmart
//
//  Created by Елизавета on 28.05.2025.
//

import SwiftUI
import CoreData

struct Second: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel: TestModel
    
    // Состояние кнопки
    @State private var isSelected1 = false
    @State private var isSelected2 = false
    @State private var isSelected3 = false
    
    init(storage: Storage) {
        _viewModel = StateObject(wrappedValue: TestModel(storage: storage))
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    //Установка цвета фона
                    Color.background.ignoresSafeArea(.all)
                    
                    ScrollView(.vertical) {}
                }
            }
        }
    }
}
