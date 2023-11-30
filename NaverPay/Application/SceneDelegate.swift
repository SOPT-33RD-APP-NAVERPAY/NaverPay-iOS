//
//  SceneDelegate.swift
//  NaverPay
//
//  Created by 곽성준 on 11/19/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

      guard let windowScene = (scene as? UIWindowScene) else { return }
      self.window = UIWindow(windowScene: windowScene)
      let viewController =  PointViewController()
      let navigationController = UINavigationController(rootViewController: TabBarViewController())
      navigationController.setNavigationBarHidden(true, animated: false)
      self.window?.rootViewController = navigationController
      self.window?.makeKeyAndVisible()
  }
}
