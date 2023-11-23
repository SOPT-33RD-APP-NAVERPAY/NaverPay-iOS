//
//  HomePlaceSectionHeaderView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit


final class HomePlaceSectionHeaderView: UICollectionReusableView {
    static let identifier: String = "HomePlaceSectionHeaderView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func setStyle() {
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}