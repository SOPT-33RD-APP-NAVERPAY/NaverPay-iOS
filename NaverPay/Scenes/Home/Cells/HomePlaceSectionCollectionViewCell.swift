//
//  MainRecomendedPlaceSectionCollectionViewCell.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomePlaceSectionCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HomePlaceSectionCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setStyle()
    }
    
    private func setStyle() {
        self.backgroundColor = .red
    }
    
    private func setLayout() {

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
