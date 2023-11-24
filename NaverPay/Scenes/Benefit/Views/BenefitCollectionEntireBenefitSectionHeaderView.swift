//
//  BenefitCollectionEntireBenefitSectionHeaderView.swift
//  NaverPay
//
//  Created by 곽성준 on 11/24/23.
//

import UIKit
import SnapKit

final class BenefitCollectionEntireBenefitSectionHeaderView: UICollectionReusableView {
        
    static let identifier = "BenefitCollectionEntireBenefitSectionHeaderView"
    
    private let whiteBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .bg_white
        return view
    }()
    
    private let entireBenefitHeaderLabel: NPLabel = {
        let label =  NPLabel(font: .font(.subtitle_bold_17), color: .sub_black)
        label.text = "즉시적립 혜택 전체보기"
        return label
    }()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setSelfStyle()
        
    }
    
    private func setSelfStyle() {
        whiteBackgroundView.roundCorners(cornerRadius: 14, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        self.backgroundColor = .bg_gray
    }
    
    private func setLayout() {
        self.addSubviews(whiteBackgroundView, entireBenefitHeaderLabel)
        
        whiteBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.trailing.leading.bottom.equalToSuperview()
        }
        
        entireBenefitHeaderLabel.snp.makeConstraints {
            $0.top.equalTo(whiteBackgroundView.snp.top).offset(23)
            $0.leading.equalToSuperview().inset(18)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
