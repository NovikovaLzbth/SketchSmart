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
                        VStack {
                            NavigationLink {
                                VectorRast()
                            } label: {
                                VStack {
                                    Text("Вектор и раст")
                                        .foregroundStyle(.babyYellow)
                                }
                                .padding(.vertical, 36)
                                .padding(.horizontal, 100)
                            }
                            .background(Color.colorPurple)
                            .cornerRadius(16)
                            .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            .padding(.bottom)
                            
                            NavigationLink {
                                Prototype()
                            } label: {
                                VStack {
                                    Text("Прототипирование")
                                        .foregroundStyle(.babyYellow)
                                }
                                .padding(.vertical, 36)
                                .padding(.horizontal, 80)
                            }
                            .background(Color.colorPurple)
                            .cornerRadius(16)
                            .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            .padding(.bottom)
                            
                            NavigationLink {
                                Psychology()
                            } label: {
                                VStack {
                                    Text("Психология в UX/UI")
                                        .foregroundStyle(.babyYellow)
                                }
                                .padding(.vertical, 36)
                                .padding(.horizontal, 78)
                            }
                            .background(Color.colorPurple)
                            .cornerRadius(16)
                            .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            .padding(.bottom)
                            
                            NavigationLink {
                                ColorTeory()
                            } label: {
                                VStack {
                                    Text("Теория цвета как основа для дизайна")
                                        .foregroundStyle(.babyYellow)
                                }
                                .padding(.vertical, 27)
                                .padding(.horizontal, 55)
                            }
                            .background(Color.colorPurple)
                            .cornerRadius(16)
                            .shadow(color: .darkPurple, radius: 5, x: 5, y: 4)
                            .padding(.bottom)
                        }
                    }
                }
                .navigationTitle("Обучение")
            }
        }
    }
}
