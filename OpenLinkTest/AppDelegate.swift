import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var universalLink: URL?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let splashScreenVC = FakeSplashScreenVC()
        window?.rootViewController = splashScreenVC
        window?.makeKeyAndVisible()

        splashScreenVC.performInitialLoading { [weak self] in
            DispatchQueue.main.async {
                let tabBarController = UITabBarController()
                self?.window?.rootViewController = tabBarController
                self?.handleUniversalLink(in: tabBarController)
            }
        }

        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        universalLink = url
        return true
    }

    func handleUniversalLink(in tabBarController: UITabBarController) {
        guard let url = universalLink else { return }
        let queryItems = URLComponents(string: url.absoluteString)?.queryItems
        if let tabItem = queryItems?.filter({ $0.name == "tab" }).first?.value {
            switch tabItem {
            case "first":
                tabBarController.selectedIndex = 0
            case "second":
                tabBarController.selectedIndex = 1
            case "third":
                tabBarController.selectedIndex = 2
            case "fourth":
                tabBarController.selectedIndex = 3
            default:
                break
            }
        }
        universalLink = nil
    }
}