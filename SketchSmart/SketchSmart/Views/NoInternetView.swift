import SwiftUI

struct NoInternetView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "wifi.slash")
                    .font(.system(size: 70))
                    .foregroundColor(.lightBlue)
                
                Text("Нет интернета")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.darkBlue)
                
                Text("Проверьте подключение")
                    .foregroundColor(.gray)
            }
        }
    }
}

