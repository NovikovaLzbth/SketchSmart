import SwiftUI
import CoreData
import AVKit
import AVFoundation

struct Typography: View {
    @State private var currentPage = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBlue.ignoresSafeArea(.all)

                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("tpg1")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("tpg2")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text("tpg3")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        // Прокуртка изображений с индикатором
                        TabView(selection: $currentPage) {
                            Image("Image 7")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(13)
                                .tag(0)
                            
                            Image("Image 8")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(13)
                                .tag(1)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .frame(height: 200)
                        
                        // Индикатор
                        HStack(alignment: .center, spacing: 8) {
                            ForEach(0..<2, id: \.self) { index in
                                Capsule()
                                    .fill(currentPage == index ? Color.white : Color.lightGray.opacity(0.5))
                                    .frame(
                                        width: currentPage == index ? 26 : 10,
                                        height: 10
                                    )
                                    .animation(.easeInOut(duration: 0.2), value: currentPage)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        
                        Text("tpg4")
                            .foregroundStyle(.white)
                        
                        Text("tpg5")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("tpg6")
                            .foregroundStyle(.white)
                        
                        Text("tpg7")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("tpg8")
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}
