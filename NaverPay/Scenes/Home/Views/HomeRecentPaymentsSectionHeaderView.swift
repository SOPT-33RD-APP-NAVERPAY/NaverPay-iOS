//
//  HomeRecentPaymentsSectionHeaderView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomeRecentPaymentsSectionHeaderView: UICollectionReusableView {
    static let identifier: String = "HomeRecentPaymentsSectionHeaderView"
    
    private let icArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.icArrowGray
        return imageView
    }()
    
    private lazy var recentPaymentLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 현장결제"
        label.font = .font(.head_bold_20)
        label.textColor = .bg_white
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "11.16"
        label.font = .font(.body_smbold_16)
        label.textColor = .main_lightgreen
        return label
    }()
    
    private lazy var viewAllLabel: UILabel = {
        let label = UILabel()
        label.text = "전체보기"
        label.font = .font(.body_regular_15)
        label.textColor = .grayscale_gray6
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setStyle()
    }
    
    private func setStyle() {
        self.backgroundColor = .clear
    }
    
    private func setLayout() {
        self.addSubviews(icArrow, recentPaymentLabel, dateLabel, viewAllLabel )
        
        recentPaymentLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(51)
            $0.leading.equalToSuperview()
            $0.width.equalTo(110)
        }
        
        dateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-18)
            $0.top.equalToSuperview().offset(55)
            $0.leading.equalTo(recentPaymentLabel.snp.trailing).inset(-7)
            $0.width.equalTo(32)
        }
        
        viewAllLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-24)
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalTo(dateLabel.snp.trailing).inset(-128)
            $0.width.equalTo(53)
        }
        
        icArrow.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-29)
            $0.leading.equalTo(viewAllLabel.snp.trailing).inset(-3)
            $0.width.equalTo(4)
            $0.height.equalTo(8)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
