//
//  BenefitCollectionFamousBenefitSectionHeaderView.swift
//  NaverPay
//
//  Created by 곽성준 on 11/23/23.
//

import UIKit
import SnapKit

final class BenefitCollectionFamousBenefitSectionHeaderView: UICollectionReusableView {
        
    static let identifier = "BenefitCollectionFamousBenefitSectionHeaderView"
    
    private let titleLabel = NPLabel(font: .font(.head_bold_20), color: .sub_black)
    private let recommendLabel = NPLabel(font: .font(.body_regular_15), color: .grayscale_gray6)
    
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = ImageLiterals.BenefitView.pointArrowSecond
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setLabelText()
    }
    
    private func setLayout() {
        self.addSubviews(titleLabel, recommendLabel, arrowImage)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(39)
            $0.leading.equalToSuperview()
        }
        
        recommendLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(1)
        }
        
        arrowImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(45)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(103)
            $0.trailing.equalToSuperview()
        }
    }
    
    private func setLabelText() {
        titleLabel.text = "실시간 인기 현장결제 혜택!"
        recommendLabel.text = "나의 최근 소비내역을 기반으로 추천해 드려요."
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
