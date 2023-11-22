//
//  MainHeaderView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomeHeaderView: UIView {

    static let identifier: String = "HomeHeaderView"
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.nLogo
        return imageView
    }()
    
    private let notiImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Global.homeIcNoti
        return imageView
    }()
    
    private let menuImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Global.homeIcMenu
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
        self.backgroundColor = .clear
    }
    
    private func setLayout() {
        self.addSubviews(logoImage,notiImage,menuImage)
        
        logoImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(64)
            $0.height.equalTo(22)
            $0.bottom.equalToSuperview().offset(-14)
        }
        
        notiImage.snp.makeConstraints {
            $0.trailing.equalTo(menuImage.snp.leadingMargin).inset(-21)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
            $0.bottom.equalToSuperview().offset(-13)
        }
        
        menuImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(28)
            $0.width.equalTo(18)
            $0.height.equalTo(14)
            $0.top.equalToSuperview().offset(22)
        }
        
    }

}
