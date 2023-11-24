//
//  BenefitCollectionViewAdBannerCell.swift
//  NaverPay
//
//  Created by 곽성준 on 11/24/23.
//

import UIKit
import SnapKit

final class BenefitCollectionViewAdBannerCell: UICollectionViewCell {
    
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 14
        return imageView
    }()
    
    let bannerImage: [UIImage] = [ImageLiterals.BenefitView.typeAd1, ImageLiterals.BenefitView.typeAd2, ImageLiterals.BenefitView.typeAd3]
    
    static let identifier: String = "BenefitCollectionViewAdBannerCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setBackgroundColor()
    }
    
    private func setBackgroundColor() {
        self.backgroundColor = .bg_gray
    }
    
    private func setLayout() {
        contentView.addSubview(bannerImageView)
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.trailing.leading.bottom.equalToSuperview()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
