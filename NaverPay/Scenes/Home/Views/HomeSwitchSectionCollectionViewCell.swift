//
//  HomeSwitchSectionCollectionViewCell.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/22.
//

import UIKit
import SnapKit

final class HomeSwitchSectionCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HomeSwitchSectionCollectionViewCell"
    
    private lazy var paymentLabel: UILabel = {
        let label = UILabel()
        label.text = "현장결제"
        label.font = .font(.subtitle_smbold_18)
        label.textColor = .bg_white
        return label
    }()
    private lazy var membershipLabel: UILabel = {
        let label = UILabel()
        label.text = "멤버쉽"
        label.font = .font(.subtitle_smbold_18)
        label.textColor = .grayscale_gray7
        return label
    }()
    private let bottomBar: UIView = {
        let view = UIView()
        view.backgroundColor = .main_lightgreen
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setLayout() {
        self.addSubviews(paymentLabel, membershipLabel, bottomBar)
        
        paymentLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(8)
        }
        
        membershipLabel.snp.makeConstraints {
            $0.leading.equalTo(paymentLabel.snp.trailing).inset(-19)
            $0.top.equalToSuperview().offset(8)
        }
        
        bottomBar.snp.makeConstraints {
            $0.top.equalTo(paymentLabel.snp.bottom)
            $0.height.equalTo(2)
            $0.leading.equalTo(paymentLabel.snp.leading).inset(1)
            $0.trailing.equalTo(paymentLabel.snp.trailing).inset(-1)
        }
    }
    
}
