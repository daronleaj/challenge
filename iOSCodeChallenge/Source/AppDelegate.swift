import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootNavigation = UINavigationController(rootViewController: AppModules.createList())
        rootNavigation.navigationBar.prefersLargeTitles = true
        
        rootNavigation.navigationBar.barTintColor = .white
        window?.rootViewController = rootNavigation
        window?.makeKeyAndVisible()
        
        UINavigationBar.appearance().barTintColor = UIColor(named: "navigationBarBarTintColor")
        UINavigationBar.appearance().tintColor = UIColor(named: "navigationBarTintColor")
        UINavigationBar.appearance().backgroundColor = UIColor(named: "navigationBarBackgroundColor")
        
        //Analytics
        AnalyticsAgent.startAnalytics()
        
        return true
    }
}


extension UINavigationBar {

    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 44)
    }

}
