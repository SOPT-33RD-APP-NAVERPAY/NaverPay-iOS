//
//  BrandCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/21.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {
    static let identifier:String = "BrandCollectionViewCell"
    
    private let brandCardImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.PlaceView.placeCardDomino
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let brandNameLabel:UILabel = {
        let label = UILabel()
        label.text = "브랜드 이름"
        label.font = UIFont.font(.detail_semibold_14)
        label.textColor = .bg_black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        
        [brandCardImageView, brandNameLabel].forEach{
            self.contentView.addSubview($0)
        }
        
        brandCardImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(9)
            $0.centerX.equalToSuperview()
        }
        
        brandNameLabel.snp.makeConstraints{
            $0.top.equalTo(brandCardImageView.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    

}
