//
//  BenefitCollectionViewPointCheckCell.swift
//  NaverPay
//
//  Created by 곽성준 on 11/21/23.
//

import UIKit

final class BenefitCollectionViewPointCheckCell: UICollectionViewCell {
    
    static let identifier = "BenefitCollectionViewPointCheckCell"
    
    var backgroundImageView = UIImageView()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundView()
    }
    
    private func setBackgroundView() {
        self.backgroundView = backgroundImageView

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
