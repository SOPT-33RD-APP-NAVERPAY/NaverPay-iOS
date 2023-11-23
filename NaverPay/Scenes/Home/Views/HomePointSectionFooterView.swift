//
//  HomePointSectionFooterView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/22.
//

import UIKit

final class HomePointSectionFooterView: UICollectionReusableView {
    static let identifier: String = "HomePointSectionFooterView"
    
    private lazy var paymentLabel: UILabel = {
        let label = UILabel()
        label.text = "결제하기"
        label.font = .font(.body_smbold_16)
        label.textColor = .bg_white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        self.backgroundColor = .sub_gd
        setLayout()
        addBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubview(paymentLabel)
        
        paymentLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(139)
            $0.leading.equalToSuperview().inset(139)
            $0.top.equalToSuperview().offset(14)
        }
    }
    
    private func addBorder() {
        layer.borderWidth = 1.0 / UIScreen.main.scale
        layer.borderColor = UIColor.main_home_cardline.cgColor
        layer.cornerRadius = 10
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        layer.cornerRadius = 10
        self.clipsToBounds = true
    }
        
}
