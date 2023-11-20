//
//  UIStackView+.swift
//  NaverPay
//
//  Created by 곽성준 on 11/21/23.
//

import UIKit

extension UIStackView {
     func addArrangedSubviews(_ views: UIView...) {
         for view in views {
             self.addArrangedSubview(view)
         }
     }
}
