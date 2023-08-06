//
//  SceneDelegate.swift
//  chat223
//
//  Created by abdiqani on 30/07/23.
//

import Foundation
import SwiftUI
import XMPPFramework

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Create the login view and set it as the root view
        let LoginSceen = LoginScreen()
        let contentView = LoginScreen.environmentObject(XMPPHandler())

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
