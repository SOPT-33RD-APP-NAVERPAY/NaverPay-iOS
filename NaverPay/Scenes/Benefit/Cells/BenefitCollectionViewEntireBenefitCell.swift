//
//  BenefitCollectionViewEntireBenefitCell.swift
//  NaverPay
//
//  Created by 곽성준 on 11/23/23.
//

import UIKit
import SnapKit

final class BenefitCollectionViewEntireBenefitCell: UICollectionViewCell {
    
    static let identifier = "BenefitCollectionViewEntireBenefitCell"
    
    var userBenefitData: BrandListAppData? {
        didSet {
            guard let data = userBenefitData else { return }
            Task {
                let image = try await NPKingFisherService.fetchImage(with: data.logoImgURL)
                brandImageView.image = image
            }
            brandNameLabel.text = data.name
            benefitDescriptionLabel.text = data.discountContent
//            benefitRateButton.setAttributedTitle( NSAttributedString(string: data.discountType,
//                                                                     attributes: [
//                                                                        NSAttributedString.Key.font : UIFont.font(.detail_bold_14),
//                                                                       NSAttributedString.Key.foregroundColor : UIColor.main_green
//                                                                       ]), for: .normal)
            rateLabel.text = data.discountType
        }
    }
     
    private let brandImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let brandNameLabel = NPLabel(font: .font(.body_bold_15), color: .sub_black)
    private let benefitDescriptionLabel = NPLabel(font: .font(.body_medium_15), color: .sub_black)

    private let rateLabel = NPLabel(font: .font(.detail_bold_14), color: .main_green)
    
    
    private lazy var benefitRateButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.background.backgroundColor = .sub_palegreen2
        config.background.cornerRadius = 100
        button.configuration = config
        button.setTitle(rateLabel.text, for: .normal)
        return button
    }()
    
    let divideView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.grayscale_gray2.cgColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    private func setLayout() {
        contentView.addSubviews(divideView, brandImageView, brandNameLabel,benefitDescriptionLabel, benefitRateButton)
        
        benefitRateButton.addSubview(rateLabel)
        
        rateLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
        }
        
        divideView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(1)
            $0.height.equalTo(2)
            $0.leading.equalToSuperview().inset(23)
            $0.trailing.equalToSuperview().inset(17)
        }
        
        brandImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(31)
            $0.width.height.equalTo(56)
        }
        
        brandNameLabel.snp.makeConstraints {
            $0.top.equalTo(brandImageView.snp.top).offset(10)
            $0.leading.equalTo(brandImageView.snp.trailing).offset(23)
        }
        
        benefitDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(brandNameLabel.snp.bottom)
            $0.leading.equalTo(brandNameLabel.snp.leading)
        }
        
        benefitRateButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(11)
            $0.width.equalTo(72)
            $0.height.equalTo(33)
        }
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
