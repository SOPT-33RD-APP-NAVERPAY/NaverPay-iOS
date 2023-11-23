//
//  BenefitCollectionViewPointCategoryCell.swift
//  NaverPay
//
//  Created by 곽성준 on 11/23/23.
//

import UIKit
import SnapKit

final class BenefitCollectionViewPointCategoryCell: UICollectionViewCell {
    
    static let identifier = "BenefitCollectionViewPointCategoryCell"
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = ImageLiterals.BenefitView.percentageCircle
        return imageView
    }()
    
    private let categoryLabel: 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    private func setLayout() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
