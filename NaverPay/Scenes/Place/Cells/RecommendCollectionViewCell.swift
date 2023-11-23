//
//  RecommendCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/21.
//

import UIKit
import SnapKit

final class RecommendCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "RecommendCollectionViewCell"
    
    private let recommendCardImageView: UIImageView = {
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
    
    private func setStyle() {
        self.layer.cornerRadius = self.contentView.frame.width/2
        self.contentView.backgroundColor = .bg_white
    }
    
    private func setLayout() {
        contentView.addSubviews(recommendCardImageView)
        
        recommendCardImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
