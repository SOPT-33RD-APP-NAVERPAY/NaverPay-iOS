//
//  PointCardCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/23.
//

import UIKit

final class PointCardCollectionViewCell: UICollectionViewCell {
    static let identifier:String = "PointCardCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {}
    
}
