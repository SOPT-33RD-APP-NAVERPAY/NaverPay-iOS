//
//  BenefitCollectionFamousBenefitSectionFooterView.swift
//  NaverPay
//
//  Created by 곽성준 on 11/23/23.
//

import UIKit
import SnapKit

final class BenefitCollectionFamousBenefitSectionFooterView: UICollectionReusableView {
      
    static let identifier = "BenefitCollectionFamousBenefitSectionFooterView"
    
    private lazy var searchStoreButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .sub_palegreen
        button.isEnabled = false
        button.layer.cornerRadius = 14
        return button
    }()
    
    private let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = ImageLiterals.BenefitView.locationImage
        return imageView
    }()
    
    private let searchStoreLabel: NPLabel = {
        let label = NPLabel(font: .font(.body_bold_16), color: .main_green)
        label.text = "내 주변 매장 찾기"
        return label
    }()
    
    
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    private func setLayout() {
        self.addSubviews(searchStoreButton)
        searchStoreButton.addSubviews(locationImageView, searchStoreLabel)
        
        searchStoreButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(308)
            $0.height.equalTo(48)
        }
        
        locationImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(90)
        }
        
        searchStoreLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(locationImageView.snp.trailing).offset(7)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
