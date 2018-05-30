import Foundation
import UIKit

open class AppDelegateSupervisor: NSObject {
    
    open var delegates: [UIApplicationDelegate] = []
    
    public convenience init(delegates: [UIApplicationDelegate]) {
        self.init()
        self.delegates = delegates
    }
}

extension AppDelegateSupervisor: UIApplicationDelegate {
    
	public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
	    return delegates.application(application, didFinishLaunchingWithOptions: launchOptions)
	}

	public func applicationDidBecomeActive(_ application: UIApplication) {
	    delegates.applicationDidBecomeActive(application)
	}

	public func applicationWillResignActive(_ application: UIApplication) {
	    delegates.applicationWillResignActive(application)
	}

	public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
	    return delegates.application(app, open: url, options: options)
	}

	public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
	    delegates.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
	}

	public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
	    delegates.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
	}

    public func applicationDidEnterBackground(_ application: UIApplication) {
        delegates.applicationDidEnterBackground(application)
    }
    
    public func applicationWillEnterForeground(_ application: UIApplication) {
        delegates.applicationWillEnterForeground(application)
    }

    public func applicationWillTerminate(_ application: UIApplication) {
        delegates.applicationWillTerminate(application)
    }
    
}
