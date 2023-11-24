//
//  UsageCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/23.
//

import UIKit
import SnapKit

final class UsageCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "UsageCollectionViewCell"
    
    private let listDateLabel = NPLabel(font: .font(.detail_semibold_14), color: .grayscale_gray5)
    
    private let lisTitleLabel = NPLabel(font: .font(.body_bold_16), color: .sub_black)
    
    private let smRightArrowIcon: UIImageView = {
       let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.smRightArrow
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    private let usageAmountLabel = NPLabel(font: .font(.body_bold_16), color: .main_green)
    
    private let usageTimeLabel = NPLabel(font: .font(.detail_semibold_14), color: .grayscale_gray5)
    
    private let lineView:UIView = {
       let view = UIView()
        view.backgroundColor = .grayscale_gray4
        
        return view
    }()
    
    private let usageDescLabel = NPLabel(font: .font(.detail_medium_14), color: .grayscale_gray5)
    
    private let circleDownArrowIcon: UIImageView = {
       let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.arrowDownIco
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        contentView.backgroundColor = .bg_white
        
        listDateLabel.text = "11.15"
        lisTitleLabel.text = "무신사"
        usageAmountLabel.text = "+2,900원"
        usageTimeLabel.text = "14:01"
        usageDescLabel.text = "구매적립"
        
        contentView.addSubviews(listDateLabel, lisTitleLabel, smRightArrowIcon , usageAmountLabel, usageTimeLabel, lineView, usageDescLabel, circleDownArrowIcon)
        
        listDateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(2)
            $0.leading.equalToSuperview()
        }
        
        lisTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(1)
            $0.leading.equalTo(listDateLabel.snp.trailing).offset(25)
        }
        
        smRightArrowIcon.snp.makeConstraints {
            $0.centerY.equalTo(lisTitleLabel)
            $0.leading.equalTo(lisTitleLabel.snp.trailing).offset(4)
        }
        
        usageAmountLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        usageTimeLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(lisTitleLabel.snp.leading)
        }
        
        lineView.snp.makeConstraints {
            $0.centerY.equalTo(usageTimeLabel)
            $0.leading.equalTo(usageTimeLabel.snp.trailing).offset(9)
            $0.height.equalTo(11)
            $0.width.equalTo(1)
        }
        
        usageDescLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(lineView.snp.trailing).offset(7)
        }
        
        circleDownArrowIcon.snp.makeConstraints {
            $0.centerY.equalTo(usageDescLabel)
            $0.leading.equalTo(usageDescLabel.snp.trailing).offset(3)
        }
        
        
        
        
        
        
    }
    
}
