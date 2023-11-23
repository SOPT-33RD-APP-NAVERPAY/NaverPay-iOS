//
//  RecommendCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/21.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    static let identifier:String = "RecommendCollectionViewCell"
    
    private let recommendCardImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.PlaceView.placeCardRecommendDummy
        imageView.contentMode = .scaleAspectFit
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
        
        self.layer.cornerRadius = self.contentView.frame.width/2
        self.contentView.backgroundColor = .bg_white
        
        
        [recommendCardImageView].forEach{
            self.contentView.addSubview($0)
        }
        
        recommendCardImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
