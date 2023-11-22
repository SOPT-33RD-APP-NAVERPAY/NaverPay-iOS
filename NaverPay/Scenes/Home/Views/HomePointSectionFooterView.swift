//
//  HomePointSectionFooterView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/22.
//

import UIKit

final class HomePointSectionFooterView: UICollectionReusableView {
    static let identifier: String = "HomePointSectionFooterView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 랜덤으로 배경색 지정
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
