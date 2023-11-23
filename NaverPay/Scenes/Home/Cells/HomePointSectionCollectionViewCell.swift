//
//  MainPointSectionCollectionViewCell.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomePointSectionCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HomePointSectionCollectionViewCell"
    
    private let borderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.imgCard_unseleced
        return imageView
    }()
    
    private let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.imgCard2
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    private func setLayout() {
        contentView.addSubviews(borderImageView, cardImageView)
        
        borderImageView.snp.makeConstraints {
            $0.bottom.trailing.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(11)
        }
        
        cardImageView.snp.makeConstraints {
            $0.bottom.trailing.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(11)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
