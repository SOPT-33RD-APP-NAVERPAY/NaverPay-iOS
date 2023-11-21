//
//  UIView+.swift
//  NaverPay
//
//  Created by 곽성준 on 11/21/23.
//

import UIKit


extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}


//그라데이션
extension UIView {
    
    enum GradientAxis {
        case vertical
        case horizontal
    }
    
    func setGradient(firstColor: UIColor, secondColor: UIColor, axis: GradientAxis) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        if axis == .horizontal {
            gradient.locations = [0.0 , 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        } else if axis == .vertical {
            gradient.type = .axial
        }
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
    
    func removeGradient() {
        self.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
    }
}

extension UIView {
    
    //코너 둥글게
    func makeCornerRound(radius : CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    //border주기
    func makeBorder(width : CGFloat, color : UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}


