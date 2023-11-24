//
//  BenefitCollectionadBannerFooterView.swift
//  NaverPay
//
//  Created by 곽성준 on 11/24/23.
//

import UIKit
import SnapKit

final class BenefitCollectionadBannerFooterView: UICollectionReusableView {
    
    static let identifier: String = "BenefitCollectionadBannerFooterView"
    
    private let csStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
//        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let adAndPointCSLabel: NPLabel = {
        let label = NPLabel(font: .font(.detail_medium_14), color: .grayscale_gray5)
        label.text = "광고&포인트 제휴문의"
        return label
    }()
    
    private let eventCSLabel: NPLabel = {
        let label = NPLabel(font: .font(.detail_medium_14), color: .main_green)
        label.text = "이벤트 고객문의"
        return label
    }()
    
    private let divideView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.grayscale_gray5.cgColor
        return view
    }()
 
    private let qnaArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.BenefitView.qnaArrow
        return imageView
    }()
        
        
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setBackgroundColor()
    }
    
   
    private func setBackgroundColor() {
        self.backgroundColor = .bg_gray
    }
    
    private func setLayout() {
        
        self.addSubviews(csStackView, qnaArrowImageView)
        csStackView.addArrangedSubviews(adAndPointCSLabel, divideView, eventCSLabel)
        
        divideView.snp.makeConstraints {
            $0.height.equalTo(12)
            $0.width.equalTo(1)
        }
        
        csStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(35)
            $0.centerX.equalToSuperview()
        }
        
        qnaArrowImageView.snp.makeConstraints {
            $0.leading.equalTo(csStackView.snp.trailing).offset(1)
            $0.top.equalTo(csStackView.snp.top).offset(1)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

