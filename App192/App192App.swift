//
//  App192App.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_kQDJKrqdzCRwewKimv6hJJKNT8urL5")
        Amplitude.instance().initializeApiKey("b7c8014c29e9f58f9ac25c538b9865c6")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App192App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
