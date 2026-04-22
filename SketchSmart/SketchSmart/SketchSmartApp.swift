import SwiftUI
import Firebase
import FirebaseAuth

@main
struct SketchSmartApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @StateObject private var networkMonitor = NetworkMonitor.shared
    
    var body: some Scene {
        WindowGroup {
            if networkMonitor.isConnected {
                Launch()
            } else {
                NoInternetView()
            }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            FirebaseApp.configure()
            
            if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
                try? Auth.auth().signOut()
                UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            }
            
            print("ok")
            return true
        }
    }
}
