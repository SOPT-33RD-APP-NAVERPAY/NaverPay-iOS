//
//  BenefitCollectionCategorySectionHeaderView.swift
//  NaverPay
//
//  Created by 곽성준 on 11/23/23.
//

import UIKit
import SnapKit

final class BenefitCollectionCategorySectionHeaderView: UICollectionReusableView {
        
    static let identifier = "BenefitCollectionCategorySectionHeaderView"
    
    private let headerTitleLabel: NPLabel = {
        let label = NPLabel(font: .font(.head_bold_20), color: .sub_black)
        label.text = "손쉽게 모으는 포인트!"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    
    private func setLayout() {
        
        self.addSubviews(headerTitleLabel)
        
        headerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(39)
            $0.leading.equalToSuperview().inset(4)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
