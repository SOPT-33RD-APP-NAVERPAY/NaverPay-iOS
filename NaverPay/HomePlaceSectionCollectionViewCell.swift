//
//  MainRecomendedPlaceSectionCollectionViewCell.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

class HomePlaceSectionCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HomePlaceSectionCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 랜덤으로 배경색 지정
        self.backgroundColor = UIColor(
            red: drand48(),
            green: drand48(),
            blue: drand48(),
            alpha: drand48()
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
