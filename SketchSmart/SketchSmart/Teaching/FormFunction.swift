import SwiftUI

struct FormFunction: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBlue.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("ff1")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("ff2")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text("ff3")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("ff4")
                            .foregroundStyle(.white)
                        
                        Text("ff5")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("ff6")
                            .foregroundStyle(.white)
                        
                        Text("ff7")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("ff8")
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

