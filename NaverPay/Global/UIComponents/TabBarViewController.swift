//
//  TabBarController.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/27.
//
import UIKit

import SnapKit

final class TabBarViewController: UITabBarController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        let assetController = UINavigationController(rootViewController: HomeViewController())
        assetController.tabBarItem = UITabBarItem(title: "자산", image: .assetIco, tag: 0)

        let sendController = UINavigationController(rootViewController: PlaceViewController())
        sendController.tabBarItem = UITabBarItem(title: "송금", image: .sendIco, tag: 1)

        let paymentController = UINavigationController(rootViewController: HomeViewController())
        paymentController.tabBarItem = UITabBarItem(title: "결제", image: .paymentIco, tag: 2)
        
        let orderController = UINavigationController(rootViewController: HomeViewController())
        orderController.tabBarItem = UITabBarItem(title: "주문", image: .orderIco, tag: 3)

        let benefitViewController = UINavigationController(rootViewController: BenefitViewController())
        benefitViewController.tabBarItem = UITabBarItem(title: "혜택", image: .benefitIco, tag: 3)

        self.viewControllers = [assetController, sendController, paymentController, orderController, benefitViewController]
        self.selectedIndex = 2
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .bg_white
        tabBarAppearance.stackedItemSpacing = 8
        let tabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearance.normal.iconColor = .grayscale_gray3
        tabBarItemAppearance.disabled.iconColor = .grayscale_gray6
        tabBarItemAppearance.selected.iconColor = .main_green
        tabBarItemAppearance.normal.titleTextAttributes = [ .foregroundColor : UIColor.grayscale_gray4, .font : UIFont.font(.normal_12)]
        tabBarItemAppearance.selected.titleTextAttributes = [ .foregroundColor : UIColor.main_green, .font : UIFont.font(.normal_12)]
        tabBarItemAppearance.disabled.titleTextAttributes = [ .foregroundColor : UIColor.grayscale_gray6, .font : UIFont.font(.normal_12)]
        tabBarAppearance.inlineLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.compactInlineLayoutAppearance = tabBarItemAppearance

        self.tabBar.standardAppearance = tabBarAppearance
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
        self.tabBar.items?[0].isEnabled = false
        self.tabBar.items?[1].isEnabled = false
        self.tabBar.items?[3].isEnabled = false
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 95
        tabBar.frame.origin.y = view.frame.height - 95
    }
}
