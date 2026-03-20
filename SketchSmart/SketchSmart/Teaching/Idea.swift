import SwiftUI

struct Idea: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBlue.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("idea1")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("idea2")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text("idea3")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("idea4")
                            .foregroundStyle(.white)
                        
                        Text("idea5")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("idea6")
                            .foregroundStyle(.white)
                        
                        Text("idea7")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Text("idea8")
                            .foregroundStyle(.white)
                        
                        Text("idea9")
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

