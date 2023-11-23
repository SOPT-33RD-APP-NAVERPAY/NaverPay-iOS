//
//  BannerCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/23.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    static let identifier:String = "BannerCollectionViewCell"
    
    private let bannerImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.banner
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        [bannerImageView].forEach{
            self.contentView.addSubview($0)
        }
        
        bannerImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
    }
    
}
