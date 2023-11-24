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
    
    var userBenefitData: BrandListAppData? {
        didSet {
            guard let data = userBenefitData else { return }
            brandIDLabel.text = "\(data.id)"
            brandImageView.image = data.logoImgURL
            brandNameLabel.text = data.name
            benefitDescriptionLabel.text = data.discountContent
            benefitRate.text = data.discountType
        }
    }
    
    private let brandIDLabel = NPLabel(font: .font(.subtitle_bold_17), color: .main_green)
 
    private let brandImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let brandAndBenefitInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()
    
    private let brandNameLabel = NPLabel(font: .font(.body_bold_15), color: .sub_black)
    private let benefitDescriptionLabel = NPLabel(font: .font(.body_medium_15), color: .sub_black)
    private let benefitRate = NPLabel(font: .font(.body_bold_16), color: .main_green)
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.BenefitView.iosBnfBtnLikeBlack, for: .normal)
        button.setImage(ImageLiterals.BenefitView.iosBnfBtnLikeRed, for: .selected)
        button.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        return button
    }()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    private func setLayout() {
        contentView.addSubviews(brandIDLabel, brandImageView, brandAndBenefitInfoStackView, heartButton)
        brandAndBenefitInfoStackView.addArrangedSubviews(brandNameLabel, benefitDescriptionLabel, benefitRate)
        
        brandIDLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(23)
            $0.top.equalToSuperview().inset(40)
        }
        
        brandImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalTo(brandIDLabel.snp.trailing).offset(17)
            $0.width.equalTo(54)
            $0.height.equalTo(40)
        }
        
        brandAndBenefitInfoStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(brandImageView.snp.trailing).offset(20)
        }
        
        heartButton.snp.makeConstraints {
            
            //글씨 짤려서 lessThanOrEqualTo 사용함
            $0.leading.lessThanOrEqualTo(brandAndBenefitInfoStackView.snp.trailing).offset(36)
            $0.centerY.equalTo(brandAndBenefitInfoStackView)
            $0.trailing.equalToSuperview().inset(20)
        }
        
    }
    
    @objc 
    private func heartButtonTapped() {
        heartButton.isSelected = !heartButton.isSelected
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}