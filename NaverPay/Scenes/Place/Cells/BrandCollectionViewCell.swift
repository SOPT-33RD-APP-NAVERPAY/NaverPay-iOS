//
//  BrandCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/21.
//

import UIKit

final class BrandCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "BrandCollectionViewCell"
    
    var userBrandPlace: PlaceList? {
        didSet {
            guard let data = userBrandPlace else {return}
            brandCardImageView.image = data.logoImgURL
            brandNameLabel.text = data.name
        }
    }
    
    
    private let brandCardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.PlaceView.placeCardDomino
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let brandNameLabel: UILabel = {
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
        self.contentView.backgroundColor = .bg_white
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        //그림자
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        

        contentView.addSubviews(brandCardImageView, brandNameLabel)
        
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
