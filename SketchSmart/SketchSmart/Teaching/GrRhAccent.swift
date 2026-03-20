import SwiftUI
import CoreData
import AVKit
import AVFoundation

struct GrRhAccent: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBlue.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("gra1")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("gra2")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text("gra3")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("gra4")
                            .foregroundStyle(.white)
                        
                        Text("gra5")
                            .foregroundStyle(.white)
                        
                        Text("gra6")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("gra7")
                            .foregroundStyle(.white)
                        
                        Text("gra8")
                            .foregroundStyle(.white)
                        
                        Text("gra9")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("gra10")
                            .foregroundStyle(.white)
                        
                        Text("gra11")
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

