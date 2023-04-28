
import UIKit
import Backendless

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let APPLICATION_ID = "YOUR-APP-ID"
    let API_KEY = "YOUR-APP-IOS-API-KEY"
    let SERVER_URL = "http://eu-api.backendless.com"

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        initBackenless()
        return true
    }
    
    private func initBackenless() {
        Backendless.shared.hostUrl = SERVER_URL
        Backendless.shared.initApp(applicationId: APPLICATION_ID, apiKey: API_KEY)
    }
}
