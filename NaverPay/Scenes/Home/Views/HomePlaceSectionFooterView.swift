//
//  HomePlaceSectionFooterView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomePlaceSectionFooterView: UICollectionReusableView {
    static let identifier: String = "HomePlaceSectionFooterView"
    
    private lazy var containerBtn: UIButton = {
        let btn = UIButton()
        btn.makeBorder(width: 1, color: .sub_gd)
        btn.makeCornerRound(radius: 6)
        btn.backgroundColor = .clear
        return btn
    }()
    
    private lazy var mapLabel: UILabel = {
        let label = UILabel()
        label.text = "지도로 보기"
        label.font = .font(.body_smbold_16)
        label.textColor = .sub_gd
        return label
    }()
    
    private let icMapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Global.mapIcon
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
        self.addSubview(containerBtn)
        containerBtn.addSubviews(mapLabel,icMapImageView)
        
        containerBtn.snp.makeConstraints {
            $0.trailing.leading.bottom.equalToSuperview()
            $0.top.equalToSuperview().offset(21)
        }
        icMapImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18.5)
            $0.bottom.equalToSuperview().offset(-16.5)
            $0.trailing.equalTo(mapLabel.snp.leading).inset(-5)
            $0.width.equalTo(17)
        }
        mapLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-13)
            $0.trailing.equalToSuperview().inset(118)
            $0.width.equalTo(74)
        }
    }
}
