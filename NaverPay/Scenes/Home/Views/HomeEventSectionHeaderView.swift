//
//  HomeEventSectionHeaderView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomeEventSectionHeaderView: UICollectionReusableView {
    static let identifier: String = "HomeEventSectionHeaderView"
    
    private let icArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.icArrowGray
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .bg_white
        label.text = "이달의 이벤트"
        label.font = .font(.head_bold_20)
        
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .clear
    }
    
    private func setLayout() {
        self.addSubviews(icArrow,titleLabel,viewAllLabel)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(110)
            $0.height.equalTo(26)
            $0.top.equalToSuperview().offset(60)
        }
        
        viewAllLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(55)
            $0.trailing.equalTo(icArrow.snp.leading).inset(-3)
            $0.width.equalTo(54)
            $0.height.equalTo(18)
        }
        
        icArrow.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-38)
            $0.trailing.equalToSuperview().inset(2)
            $0.width.equalTo(4)
            $0.height.equalTo(8)
        }
    }
}
