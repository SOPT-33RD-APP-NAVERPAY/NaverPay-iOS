//
//  BenefitCollectionPointCheckBackgroundView.swift
//  NaverPay
//
//  Created by 곽성준 on 11/21/23.
//

import UIKit
import SnapKit

final class BenefitCollectionViewFamousBenefitSectionBackgroundView: UICollectionReusableView {
        
    static let identifier = "BenefitCollectionViewFamousBenefitSectionBackgroundView"
    
    private let whiteSectionBackgroundView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSelfStyle()
        setLayout()
    }
    
    private func setSelfStyle() {
        self.layer.cornerRadius = 14
        self.backgroundColor = .bg_gray
        
        whiteSectionBackgroundView.backgroundColor = .bg_white
        whiteSectionBackgroundView.layer.cornerRadius = 14

    }
    
    private func setLayout() {
        self.addSubviews(whiteSectionBackgroundView)
        
        whiteSectionBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(102)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
