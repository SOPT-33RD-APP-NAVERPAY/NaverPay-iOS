//
//  MainRecomendedPlaceSectionCollectionViewCell.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomePlaceSectionCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HomePlaceSectionCollectionViewCell"
    
    var homeDataAppData: BrandAppData? {
        didSet {
            guard let data = homeDataAppData else { return }
            storeNameLabel.text = "\(data.name) \(data.place)"
            logoImageView.image = ImageLiterals.MainView.logoCuDummy
            descriptionLabel.text = data.discountContent
        }
    }
    
    private let storeNameLabel: NPLabel = {
        let label = NPLabel(font: .font(.detail_regular_14), color: .grayscale_gray5)
        label.text = "CU 건대점"
        return label
    }()
    
    private let descriptionLabel: NPLabel = {
        let label = NPLabel(font: .font(.body_smbold_16), color: .bg_white)
        label.text = "네플멤 회원은 최대 10%"
        return label
    }()
    
    private let icArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.icArrowGray
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.logoCuDummy
        return imageView
    }()
    
    private let logoBackgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .bg_white
        backgroundView.layer.cornerRadius = 6
        return backgroundView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubviews(storeNameLabel,descriptionLabel,icArrowImageView,logoBackgroundView)
        logoBackgroundView.addSubview(logoImageView)
        
        logoBackgroundView.snp.makeConstraints {
            $0.bottom.top.leading.equalToSuperview()
            $0.width.equalTo(52)
        }
        storeNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalTo(logoBackgroundView.snp.trailing).inset(-17)
            $0.bottom.equalTo(descriptionLabel.snp.top).offset(-2)
            $0.width.equalTo(116)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(storeNameLabel.snp.leading)
            $0.width.equalTo(226)
            $0.height.equalTo(24)
        }
        icArrowImageView.snp.makeConstraints {
            $0.leading.equalTo(descriptionLabel.snp.trailing).inset(-20)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(4)
            $0.height.equalTo(8)
        }
        logoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }
    
    private func setStyle() {
        self.backgroundColor = .clear
    }
}
