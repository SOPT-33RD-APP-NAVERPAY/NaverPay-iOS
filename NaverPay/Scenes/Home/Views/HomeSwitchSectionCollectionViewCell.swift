//
//  HomeSwitchSectionCollectionViewCell.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/22.
//

import UIKit

final class HomeSwitchSectionCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HomeSwitchSectionCollectionViewCell"
    
    let customView = HomeSwitchSectionView()

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupUI()
        }

        private func setupUI() {
            addSubview(customView)

            customView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
    
}
