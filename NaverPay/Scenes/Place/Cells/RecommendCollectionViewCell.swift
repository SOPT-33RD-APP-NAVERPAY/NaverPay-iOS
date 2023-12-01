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
    
    var userRecommendPlace: PlaceBrandList? {
        didSet {
            guard let data = userRecommendPlace else {return}
            Task {
                let image = try await NPKingFisherService.fetchImage(with: data.logoImgURL)
                recommendCardImageView.image = image
            }

            
        }
    }
    
    private let recommendCardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.PlaceView.placeCardRecommendDummy
        imageView.contentMode = .scaleAspectFit
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
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShadowPath()
    }

    private func updateShadowPath() {
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.frame.width/2).cgPath
    }
    
    private func setStyle() {
        self.contentView.backgroundColor = .bg_white
    }
    
    private func setLayout() {
        
        self.layer.shadowOffset = .init(width: 0, height: 1)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1
        
        contentView.addSubviews(recommendCardImageView)
        contentView.layer.cornerRadius = self.contentView.frame.width/2
        contentView.layer.masksToBounds = false
        contentView.clipsToBounds = true
        
        recommendCardImageView.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(14)
        }
    }
}
