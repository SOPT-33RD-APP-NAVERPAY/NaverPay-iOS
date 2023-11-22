//
//  HomePointSectionBackgroundView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomePointSectionBackgroundView: UICollectionReusableView {
    static let identifier: String = "HomePointSectionBackgroundView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSelfStyle()
    }
    
    private func setSelfStyle() {
        self.layer.cornerRadius = 10
        self.backgroundColor = .main_home_cardline
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
