//
//  Psychology.swift
//  SketchSmart
//
//  Created by Елизавета on 23.05.2025.
//

import SwiftUI
import CoreData

struct Psychology: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("Что такое принципы гештальта в UX/UI?")
                            .font(.title)
                            .bold(true)
                            .foregroundStyle(.babyYellow)
                            .padding(.bottom)
                        
                        Text("Die Gestalt с немецкого — конструкция, конфигурация, структура, телосложение, фигура, вид, роль, оформление, габитус, целостность, форма, образ, облик.")
                            .foregroundStyle(.white)
                            .bold(true)
                            .padding(.bottom)
                        
                        Text("Принципы гештальта — это набор законов, описывающих, как люди считывают образы и упорядочивают их в целостную картину. В UX/UI эти принципы описывают то, как люди воспринимают и понимают элементы на цифровых экранах.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("Человеческий мозг быстро распознаёт знакомое. Знакомое — значит, предсказуемое и безопасное.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 5")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                        
                        Text("Взгляд всегда цепляется за элемент, который выделяется среди группы других, схожих.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 6")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                        
                        Text("Пользователи воспринимают симметричные объекты как принадлежащие к одной группе.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 7")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                        
                        Text("Параллельные элементы мы воспринимаем как связанные.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 8")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                        
                        Text("Понимание и применение психологических принципов в UX/UI-дизайне помогает создавать продукты, которые не только удовлетворяют потребности пользователей, но и вызывают положительные эмоции.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                    }
                    // Растягивает VStack и выравнивает контент
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
            }
        }
    }
}
