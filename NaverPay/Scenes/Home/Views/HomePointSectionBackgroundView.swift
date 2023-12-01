//
//  HomePointSectionBackgroundView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomePointSectionBackgroundView: UICollectionReusableView {
    static let identifier: String = "HomePointSectionBackgroundView"
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.main_darkgreen3.withAlphaComponent(0.9)
        return backgroundView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setGradientBackground()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    private func setGradientBackground() {
        let gradientLayer = CAGradientLayer()

        gradientLayer.colors = [
            UIColor(red: 0.03, green: 0.67, blue: 0.55, alpha: 1.00).cgColor,  // #07AA8C
            UIColor(red: 0.02, green: 0.67, blue: 0.40, alpha: 1.00).cgColor  // #06AA65
        ]

        let angle = 113.0 * .pi / 180.0
        let x = cos(angle)
        let y = sin(angle)

        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.frame = bounds
        gradientLayer.locations = [0.0232, 0.9345]

        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setLayout() {
        self.addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}
