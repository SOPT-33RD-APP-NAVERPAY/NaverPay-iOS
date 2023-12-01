//
//  NPToast.swift
//  NaverPay
//
//  Created by 곽성준 on 12/1/23.
//

import UIKit

import SnapKit

final class LHToast {
    static func show (message: String, duration: TimeInterval = 1, isTabBar: Bool = true, completion: (() -> Void)? = nil) {
        let toastView = LHToastView(message: message)
        guard let window = UIWindow.current else { return }
        window.subviews
            .filter { $0 is LHToastView }
            .forEach { $0.removeFromSuperview() }
        window.addSubview(toastView)
        
        toastView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(120)
            
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        window.layoutSubviews()
        
        fadeIn(completion: {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                fadeOut(completion: {
                    completion?()
                })
            }
        })
        
        func fadeIn(completion: (() -> Void)? = nil) {
            toastView.alpha = 0
            UIView.animate(withDuration: 0.5) {
                toastView.alpha = 1
            } completion: { _ in
                completion?()
            }
            
        }
        
        func fadeOut(completion: (() -> Void)? = nil) {
            toastView.alpha = 1
            UIView.animate(withDuration: 0.5) {
                toastView.alpha = 0
            } completion: { _ in
                toastView.removeFromSuperview()
                completion?()
            }
        }
    }
}

