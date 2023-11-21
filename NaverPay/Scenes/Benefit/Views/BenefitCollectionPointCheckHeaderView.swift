//
//  BenefitCollectionPointCheckHeaderView.swift
//  NaverPay
//
//  Created by 곽성준 on 11/21/23.
//

import UIKit
import SnapKit

final class BenefitCollectionPointCheckHeaderView: UICollectionReusableView {
        
    static let identifier = "BenefitCollectionPointCheckHeaderView"
    
     private let userNameLabel: UILabel = {
        let label = UILabel()
         label.font = .font(.subtitle_bold_17)
         label.text = "남희주님의 포인트"
        return label
    }()
    
    private let userPointLabel: UILabel = {
       let label = UILabel()
        label.font = .font(.head_bold_20)
        label.text = "11500원"
       return label
   }()
    
    private let pointArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.BenefitView.pointArrowFirst
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        
    }
    
    private func setLayout() {
        self.addSubviews(userNameLabel, userPointLabel, pointArrowImageView)
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.leading.equalToSuperview().inset(20)
        }
        
        userPointLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
//            $0.leading.equalTo(userNameLabel.snp.trailing).offset(97)
            $0.trailing.equalToSuperview().inset(29)
        }
        
        pointArrowImageView.snp.makeConstraints {
            $0.centerY.equalTo(userPointLabel)
            $0.leading.equalTo(userPointLabel.snp.trailing)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
