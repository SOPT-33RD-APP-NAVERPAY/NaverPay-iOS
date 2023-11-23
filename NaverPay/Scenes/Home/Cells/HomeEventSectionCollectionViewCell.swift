//
//  MainEventSectionCollectionViewCell.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomeEventSectionCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HomeEventSectionCollectionViewCell"
    
    private let benefitLabel: NPLabel = {
        let label = NPLabel(font: .font(.detail_regular_14), color: .bg_white.withAlphaComponent(0.8))
        label.text = "매일매일 더블혜택"
        return label
    }()
    
    private let benefitDetailLabel: NPLabel = {
        let label = NPLabel(font: .font(.subtitle_bold_17), color: .bg_white)
        label.text = "최대 10%"
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.event_img_logo_touslesjours
        return imageView
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
        contentView.addSubviews(benefitLabel,benefitDetailLabel,logoImageView)
        
        logoImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(13)
            $0.width.equalTo(55)
            $0.height.equalTo(55)
        }
        benefitLabel.snp.makeConstraints {
            $0.leading.equalTo(logoImageView.snp.trailing).inset(-20)
            $0.top.equalToSuperview().offset(22)
            $0.width.equalTo(150)
            $0.height.equalTo(17)
        }
        benefitDetailLabel.snp.makeConstraints {
            $0.leading.equalTo(logoImageView.snp.trailing).inset(-20)
            $0.top.equalTo(benefitLabel.snp.bottom).offset(4)
            $0.width.equalTo(67)
            $0.height.equalTo(22)
        }
    }
    
    private func setStyle() {
        self.layer.cornerRadius = 6
        self.backgroundColor = .tous_les_bg
    }
}
