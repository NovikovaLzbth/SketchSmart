//
//  VectorRast.swift
//  SketchSmart
//
//  Created by Елизавета on 22.05.2025.
//

import SwiftUI
import CoreData

struct VectorRast: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack {
                        Text("Чем векторные изображения отличаются от растровых?")
                            .font(.title)
                            .bold(true)
                            .foregroundStyle(.babyYellow)
                            .padding(.bottom)
                        
                        Text("В компьютерной графике принято различать два вида изображений: векторные и растровые. Разберёмся, в чём их различия.")
                            .foregroundStyle(.white)
                        
                        HStack {
                            Image("Image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170)
                                .cornerRadius(10)
                            
                            Image("Image 1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170)
                                .cornerRadius(10)
                        }
                        
                        Text("На первый взгляд, два абсолютно одинаковых изображения. Увеличим масштаб изображения и сравним ещё раз.")
                            .foregroundStyle(.white)
                        
                        HStack {
                            Image("Image 3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170)
                                .cornerRadius(10)
                            
                            Image("Image 2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170)
                                .cornerRadius(10)
                        }
                        
                        VStack {
                            Text("Одно изображение распалось на отдельные точки, а качество другого не изменилось. С чем это связано? Дело в том, что первое изображение — растровое, а второе — векторное. ")
                                .padding(.bottom)
                            
                            Text("Растровые изображения состоят из отдельных точек — пикселей, каждая из которых кодируется отдельно. Человеческий глаз одиночные пиксели обычно не различает. ")
                                .padding(.horizontal, -1.8)
                            
                            Text("Растровая графика позволяет воспроизвести с фотографической точностью практически любой рисунок, вне зависимости от сложности, в отличие от векторной, где невозможно точно передать переход от одного цвета к другому без потерь в размере файла.")
                                .padding(.bottom)
                            
                            Text("Векторные изображения состоят из геометрических фигур (с указанием их параметров): точек, прямых, прямоугольников, окружностей. Такие изображения не отличаются фотографической точностью, но при масштабировании они не теряют качества. Когда размер изображения увеличивают, все геометрические объекты пересчитываются и качество остаётся прежним.")
                            
                            Text("Размер, который занимает описательная часть, не зависит от реальной величины объекта. Это позволяет использовать минимальное количество информации и описывать любой большой объект файлом минимального размера.")
                        }
                        .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
    }
}
