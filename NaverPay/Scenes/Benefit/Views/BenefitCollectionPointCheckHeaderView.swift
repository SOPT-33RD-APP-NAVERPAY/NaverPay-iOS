//
//  BenefitCollectionPointCheckHeaderView.swift
//  NaverPay
//
//  Created by 곽성준 on 11/21/23.
//

import UIKit
import SnapKit

protocol NextButtonTapProtocol: AnyObject {
    func nextVC()
        
}

final class BenefitCollectionPointCheckHeaderView: UICollectionReusableView {
    
    static let identifier = "BenefitCollectionPointCheckHeaderView"
    
    weak var delegate: NextButtonTapProtocol?
    
    var userData: UserBenefitDataAppData? {
        didSet {
            guard let data = userData else { return }
            userNameLabel.text = data.userName
            userPointLabel.text = "\(data.userPoint)원"
        }
    }
    
    private let userNameLabel = NPLabel(font: .font(.subtitle_bold_17), color: .sub_black)
    
    private let userPointLabel = NPLabel(font: .font(.head_bold_20), color: .sub_black)
    
    private let pointArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.BenefitView.pointArrowFirst
        return imageView
    }()
    
    private let nextButtonView = UIView()
    
    private let containView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
        let goToNextVC = UITapGestureRecognizer(target: self, action: #selector(nextButtonTapped))
        
        nextButtonView.isUserInteractionEnabled = true
        nextButtonView.addGestureRecognizer(goToNextVC)

        
    }
    
    private func setStyle() {
        self.layer.cornerRadius = 14
        self.backgroundColor = .bg_gray
        containView.backgroundColor = .bg_white
        containView.layer.cornerRadius = 14
    }
    
    private func setLayout() {
        self.addSubviews(containView)
        containView.addSubviews(userNameLabel,nextButtonView)
        nextButtonView.addSubviews( userPointLabel, pointArrowImageView)
        
       
        
        containView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        nextButtonView.snp.makeConstraints {
            $0.top.equalTo(containView.snp.top).offset(15)
            $0.trailing.equalToSuperview().inset(5)
            $0.width.equalTo(90)
            $0.height.equalTo(35)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.leading.equalToSuperview().inset(20)
        }
        
        userPointLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        pointArrowImageView.snp.makeConstraints {
            $0.centerY.equalTo(userPointLabel)
            $0.leading.equalTo(userPointLabel.snp.trailing)
        }
        
    }
    
    @objc
    private func nextButtonTapped() {
        self.delegate?.nextVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
