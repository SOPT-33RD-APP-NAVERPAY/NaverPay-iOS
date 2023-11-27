//
//  BenefitHeaderView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/28.
//

import UIKit

protocol BenefitHeaderViewDelegate: AnyObject {
    func arrowButtonTapped()
}

final class BenefitHeaderView: UIView,UIGestureRecognizerDelegate {
    static let identifier: String = "BenefitHeaderView"
    
    weak var delegate: BenefitHeaderViewDelegate?
    
    private let titleLabel: NPLabel = {
        let label = NPLabel(font: .font(.number_bold_27), color: .sub_black)
        label.text = "혜택"
        return label
    }()
    
    private lazy var bellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = ImageLiterals.BenefitView.bnfIcNoti.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .sub_black
        return imageView
    }()
    
    private lazy var notiImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = ImageLiterals.Global.homeIcMenu.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .sub_black
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .bg_white
    }
    
    private func setLayout() {
        self.addSubviews(titleLabel,bellImage,notiImage)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(22)
            $0.height.equalTo(32)
            $0.width.equalTo(47)
            $0.top.equalToSuperview().offset(57)
        }
        
        bellImage.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).inset(-209)
            $0.height.equalTo(27)
            $0.width.equalTo(27)
            $0.top.equalToSuperview().offset(54)
        }
        
        notiImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(23)
            $0.height.equalTo(25)
            $0.width.equalTo(25)
            $0.top.equalToSuperview().offset(54)
        }
    }
    
    @objc private func arrowButtonTapped() {
        delegate?.arrowButtonTapped()
    }
}


