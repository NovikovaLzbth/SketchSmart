//
//  ColorTeory.swift
//  SketchSmart
//
//  Created by Елизавета on 23.05.2025.
//

import SwiftUI
import CoreData

struct ColorTeory: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("Теория цвета как основа для дизайна и иллюстрации")
                            .font(.title)
                            .bold(true)
                            .foregroundStyle(.babyYellow)
                            .padding(.bottom)
                        
                        Text("Чтобы лучше понять цвет и его теорию, мы для начала вспомним, какие в цветовом круге существуют категории.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("Основные цвета выступают основой для получения всех остальных цветов. К ним относятся красный, синий и желтый. (примечание: данное определение характерно для художественной системы цветовоспроизведения, которая расходится с аддитивной системой RGB Максвелла, где основными цветами являются красный, зеленый и синий).")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("Вторичные цвета получаются совмещением двух основных. К ним относятся оранжевый, фиолетовый и зеленый.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("Третичные цвета создаются смешиванием основных со вторичными. Всего их насчитывается шесть: красно-оранжевый, красно-фиолетовый, сине-фиолетовый, сине-зеленый, желто-зеленый и желто-оранжевый.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 9")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                        
                        Image("Image 10")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                        
                        Text("Тон указывает на цветовой пигмент и может полноправно называться соответствующим цветом.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("Хроматичность описывает чистоту цвета. Высокая хроматичность тона указывает на то, что в нем отсутствует черный, серый и белый. С другой стороны, присутствие черного или серого просто снижает хроматичность. Дизайнер должен понимать, что следует избегать использования тонов со схожей хроматичностью и предпочитать брать те, чья хроматичность отличается на несколько оттенков.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("Насыщенность определяет, как выглядит тон при различный условиях освещения. Для достижения цветового соответствия рекомендуется использовать степени насыщенности, максимально приближенные к природным.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("Тональности представляют цвета, получающиеся после добавлении в тон серого. Смотрятся они тускло и скучно, как старые программы, в связи с чем подходят далеко не для всех дизайнерских решений. Тем не менее, если в проект нужно добавить винтажный эффект, с их помощью можно сделать это более элегантно.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("Тени используются для затемнения цвета путем добавления в его тон черного.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("Оттенок противоположен тени и отражает, сколько белого было добавлено к цвету. Оттенки зачастую применяются в области женского дизайна, и их в изобилии можно встретить на сайтах, посвященных родительству или воспитанию юных детишек.")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 11")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
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
