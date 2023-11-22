//
//  BenefitCollectionPointCheckBackgroundView.swift
//  NaverPay
//
//  Created by 곽성준 on 11/21/23.
//

import UIKit

final class BenefitCollectionViewSectionBackgroundView: UICollectionReusableView {
        
    static let identifier = "BenefitCollectionPointCheckBackgroundView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSelfStyle()
    }
    
    private func setSelfStyle() {
        self.layer.cornerRadius = 14
        self.backgroundColor = .bg_white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
