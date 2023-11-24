//
//  BenefitCollectionViewCSCell.swift
//  NaverPay
//
//  Created by 곽성준 on 11/24/23.
//

import UIKit
import SnapKit

final class BenefitCollectionViewCSCell: UICollectionViewCell {
    
    static let identifier: String = "BenefitCollectionViewCSCell"
    
    private let adAndPointCSLabel: NPLabel = {
        let label = NPLabel(font: .font(.detail_smbold_12), color: .grayscale_gray5)
        label.text = "광고&포인트 제휴문의"
        return label
    }()
    
    private let eventCSLabel: NPLabel = {
        let label = NPLabel(font: .font(.detail_smbold_12), color: .main_green)
        label.text = "광고&포인트 제휴문의"
        return label
    }()
    
    private let divideView: UIView = {
        let view = UIView()
        view.backgroundColor = .grayscale_gray5
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setBackgroundColor()
    }
    
    private func setBackgroundColor() {
        self.backgroundColor = .bg_gray
    }
    
    private func setLayout() {
        contentView.addSubview(bannerImageView)
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.trailing.leading.bottom.equalToSuperview()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

}
