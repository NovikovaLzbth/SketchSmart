import SwiftUI

struct DesignThinking: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBlue.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("des1")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("des2")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text("des3")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("des4")
                            .foregroundStyle(.white)
                        
                        Text("des5")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("des6")
                            .foregroundStyle(.white)
                        
                        Text("des7")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("des8")
                            .foregroundStyle(.white)
                        
                        Text("des9")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("des10")
                            .foregroundStyle(.white)
                        
                        Text("des11")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("des12")
                            .foregroundStyle(.white)
                        
//                            Image("Image 9")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: 220)
//                                .cornerRadius(20)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

