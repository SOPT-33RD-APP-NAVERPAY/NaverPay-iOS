//
//  NearPlaceCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/21.
//

import UIKit
import SnapKit

final class NearPlaceCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "NearPlaceCollectionViewCell"
    
    private let nearPlaceCardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.PlaceView.placeCardCU
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nearPlaceNameLabel: UILabel = {
        let label = UILabel()
        label.text = "매장 이름"
        label.font = UIFont.font(.detail_semibold_14)
        label.textColor = .bg_black
        return label
    }()
    
    private let nearPlaceMeterLabel: UILabel = {
        let label = UILabel()
        label.text = "00m"
        label.font = UIFont.font(.detail_smbold_12)
        label.textColor = .main_green2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShadowPath()
    }

    private func updateShadowPath() {
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
    }
    
    private func setLayout() {
        self.contentView.backgroundColor = .bg_white
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        //그림자
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        contentView.addSubviews(nearPlaceCardImageView, nearPlaceNameLabel, nearPlaceMeterLabel)
        
        nearPlaceCardImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(12)
            $0.centerX.equalToSuperview().inset(13)
        }
        
        nearPlaceNameLabel.snp.makeConstraints{
            $0.top.equalTo(nearPlaceCardImageView.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
        }
        
        nearPlaceMeterLabel.snp.makeConstraints{
            $0.top.equalTo(nearPlaceNameLabel.snp.bottom).offset(3)
            $0.centerX.equalToSuperview()
        }
    }
    
    
    
    
}


