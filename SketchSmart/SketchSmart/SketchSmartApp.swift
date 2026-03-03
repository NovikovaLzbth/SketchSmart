import SwiftUI
import Firebase
import FirebaseAuth

@main
struct SketchSmartApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            Launch()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            FirebaseApp.configure()
            
            // Проверка на первый запуск
                if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
                    try? Auth.auth().signOut()
                    
                    UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
                    UserDefaults.standard.synchronize()
                }
            
            print("ok")
            return true
        }
    }
}
