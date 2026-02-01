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
                    VStack(alignment: .leading) {
                        Text("pls1")
                            .font(.title)
                            .bold(true)
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("pls2")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.bottom)
                        
                        Text("pls3")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold(true)
                        
                        Text("pls4")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .padding(.bottom)
                        
                        Text("pls5")
                            .foregroundStyle(.white)
                            .padding(.bottom, 20)
                        
                        Text("pls6")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold(true)
                        
                        Text("pls7")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
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
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                        
                        Text("pls8")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.bottom, 20)
                        
                        Text("pls9")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold(true)
                        
                        Text("pls10")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 4")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .padding(.bottom)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
            }
        }
    }
}
