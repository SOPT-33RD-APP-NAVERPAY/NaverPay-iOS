//
//  UIWindow+.swift
//  NaverPay
//
//  Created by 곽성준 on 12/1/23.
//

import UIKit

extension UIWindow {
    public static var current: UIWindow? {
        UIApplication.shared.windows.first(where: \.isKeyWindow)
    }
}
