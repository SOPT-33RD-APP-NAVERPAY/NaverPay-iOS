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
    
    var categoryData: CategoryData? {
        didSet {
            guard let data = categoryData else { return }
            self.categoryImageView.image = data.categoryIcon
            self.categoryLabel.text = data.categoryLabel
        }
    }
    let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let categoryLabel = NPLabel(font: UIFont.font(.detail_smbold_12), color: .sub_black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    private func setLayout() {
        self.addSubviews(categoryImageView, categoryLabel)
        
        categoryImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(categoryImageView.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
