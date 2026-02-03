import SwiftUI
import CoreData
import AVKit
import AVFoundation

struct PointLineStain: View {
    @State private var currentPage = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBlue.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("pls1")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("pls2")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text("pls3")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("pls4")
                            .foregroundStyle(.white)
                        
                        Image("Image")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                        
                        Text("pls5")
                            .foregroundStyle(.white)
                        
                        Text("pls6")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("pls7")
                            .foregroundStyle(.white)
                        
                        // Прокуртка изображений с индикатором
                        TabView(selection: $currentPage) {
                            Image("Image 1")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 230)
                                .cornerRadius(13)
                                .tag(0)
                            
                            Image("Image 2")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 230)
                                .cornerRadius(13)
                                .tag(1)
                            
                            Image("Image 3")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 230)
                                .cornerRadius(13)
                                .tag(2)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .frame(height: 230)
                        
                        // Индикатор
                        HStack(alignment: .center, spacing: 8) {
                            ForEach(0..<3, id: \.self) { index in
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
                        
                        Text("pls8")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text("pls9")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("pls10")
                            .foregroundStyle(.white)
                        
                        Image("Image 4")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}
