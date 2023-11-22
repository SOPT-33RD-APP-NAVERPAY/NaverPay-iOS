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
 
        self.backgroundColor = .clear
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubview(paymentLabel)
        
        paymentLabel.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(139)
            $0.top.bottom.equalToSuperview().offset(-14)
        }
    }
        
}
