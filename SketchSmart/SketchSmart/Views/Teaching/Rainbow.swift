import SwiftUI
import CoreData
import AVKit
import AVFoundation

struct Rainbow: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBlue.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("rnbw1")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("rnbw2")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text("rnbw3")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        HStack {
                            Spacer()
                            Image("Image 5")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 200)
                                .cornerRadius(20)
                            Spacer()
                        }
                        
                        Text("rnbw4")
                            .foregroundStyle(.white)
                        
                        Text("rnbw5")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Image("Image 6")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                        
                        Text("rnbw6")
                            .foregroundStyle(.white)
                        
                        Text("rnbw7")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("rnbw8")
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}
