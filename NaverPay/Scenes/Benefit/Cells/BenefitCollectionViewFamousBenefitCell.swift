//
//  BenefitCollectionViewFamousBenefitCell.swift
//  NaverPay
//
//  Created by 곽성준 on 11/22/23.
//

import UIKit
import SnapKit

final class BenefitCollectionViewFamousBenefitCell: UICollectionViewCell {
    
    static let identifier = "BenefitCollectionViewFamousBenefitCell"
    
    private let brandIDLabel = NPLabel(font: .font(.subtitle_bold_17), color: .main_green)
 
    private let brandImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let brandAndBenefitInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()
    
    private let brandNameLabel = NPLabel(font: .font(.body_bold_15), color: .sub_black)
    private let benefitDescriptionLabel = NPLabel(font: .font(.body_medium_15), color: .sub_black)
    private let benefitRate = NPLabel(font: .font(.body_bold_16), color: .main_green)
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.isHidden = false
        button.setImage(ImageLiterals.BenefitView.iosBnfBtnLikeRed, for: .normal)
        return button
    }()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        
        brandIDLabel.text = "1"
        brandNameLabel.text = "CU"
        benefitDescriptionLabel.text = "네플멤 회원은 CU 최대"
        benefitRate.text = "더블혜택"
        
    }
    
    private func setLayout() {
        contentView.addSubviews(brandIDLabel, brandImageView, brandAndBenefitInfoStackView, heartButton)
        brandAndBenefitInfoStackView.addArrangedSubviews(brandNameLabel, benefitDescriptionLabel, benefitRate)
        
        brandIDLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(23)
            $0.centerY.equalToSuperview()
        }
        
        brandImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(brandIDLabel.snp.trailing).offset(17)
            $0.width.equalTo(54)
            $0.height.equalTo(40)
        }
        
        brandAndBenefitInfoStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(brandImageView.snp.trailing).offset(20)
        }
        
        heartButton.snp.makeConstraints {
            $0.leading.equalTo(brandAndBenefitInfoStackView.snp.trailing).offset(36)
            $0.centerY.equalToSuperview()
        }
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
