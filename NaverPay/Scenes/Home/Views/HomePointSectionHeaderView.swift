//
//  HomePointSectionHeaderView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomePointSectionHeaderView: UICollectionReusableView {
    
    static let identifier: String = "HomePointSectionHeaderView"
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.nLogo
        return imageView
    }()
    
    private let arrowImage1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.icArrow
        return imageView
    }()
    
    private let arrowImage2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.icArrow
        return imageView
    }()
    
    private let pIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.icP
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "네이버 포인트"
        label.font = .font(.head_bold_20)
        label.textColor = .bg_white
        return label
    }()
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.text = "출금계좌"
        label.font = .font(.body_regular_15)
        label.textColor = .bg_white
        label.layer.opacity = 0.6
        return label
    }()
    
    private lazy var accountDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "하나 3579"
        label.font = .font(.body_smbold_16)
        label.textColor = .bg_white
        return label
    }()
    
    private lazy var depositLabel: UILabel = {
        let label = UILabel()
        label.text = "보유금액"
        label.font = .font(.body_regular_15)
        label.textColor = .bg_white
        label.layer.opacity = 0.6
        return label
    }()
    
    private lazy var depositDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "15,000"
        label.font = .font(.number_bold_27)
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
        self.addSubviews(logoImage, titleLabel, arrowImage1, arrowImage2,accountLabel, accountDetailLabel, depositLabel, depositDetailLabel, pIconImage )
        
        logoImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(24)
            $0.top.equalToSuperview().offset(24)
            $0.width.equalTo(37)
            $0.height.equalTo(34)
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(110)
            $0.leading.equalToSuperview().inset(23)
            $0.bottom.equalToSuperview().offset(-128)
            $0.top.equalToSuperview().offset(24)
        }
        
        accountLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(-259)
            $0.leading.equalToSuperview().inset(23)
            $0.bottom.equalToSuperview().offset(-49)
            $0.top.equalTo(titleLabel.snp.bottom).offset(61)
        }
        
        accountDetailLabel.snp.makeConstraints {
            $0.width.equalTo(66)
            $0.leading.equalToSuperview().inset(23)
            $0.bottom.equalToSuperview().offset(-20)
            $0.top.equalTo(accountLabel.snp.bottom).offset(5)
        }
        
        arrowImage1.snp.makeConstraints {
            $0.leading.equalTo(accountDetailLabel.snp.trailing).inset(2)
            $0.top.equalTo(titleLabel.snp.bottom).offset(89)
            $0.height.width.equalTo(12)
        }
        
        depositLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(138)
            $0.leading.equalTo(arrowImage1.snp.trailing).inset(-41)
            $0.bottom.equalToSuperview().offset(-22)
            $0.top.equalToSuperview().offset(138)
        }
        
        depositDetailLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(53)
            $0.leading.equalTo(depositLabel.snp.trailing).inset(12)
            $0.bottom.equalToSuperview().offset(-15)
            $0.top.equalToSuperview().offset(131)
        }
        
        pIconImage.snp.makeConstraints {
            $0.leading.equalTo(depositDetailLabel.snp.trailing).inset(4)
            $0.bottom.equalToSuperview().offset(-21)
            $0.width.equalTo(14)
            $0.height.equalTo(20)
        }
        
        arrowImage2.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(19)
            $0.width.equalTo(12)
            $0.height.equalTo(12)
            $0.bottom.equalToSuperview().offset(-25)
        }
    }
        
}
