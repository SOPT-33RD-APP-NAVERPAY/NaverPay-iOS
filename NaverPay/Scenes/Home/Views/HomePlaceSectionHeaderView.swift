//
//  HomePlaceSectionHeaderView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit


final class HomePlaceSectionHeaderView: UICollectionReusableView {
    static let identifier: String = "HomePlaceSectionHeaderView"
    
    private let icArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.icArrowGray
        return imageView
    }()
    
    //  특정 부분에만 색상이 다르고, 줄바꿈이 되도록 구현
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .bg_white
        
        let fullText = "네이버페이가 가능한\n곳을 추천드려요"
        let attributedText = NSMutableAttributedString(string: fullText)
        let naverpayRange = (fullText as NSString).range(of: "네이버페이")
        attributedText.addAttribute(.foregroundColor, value: UIColor.main_lightgreen, range: naverpayRange)
        
        let newlineRange = (fullText as NSString).range(of: "\n")
        attributedText.addAttribute(.font, value: UIFont.font(.head_bold_20), range: NSRange(location: 0, length: newlineRange.location))
        attributedText.addAttribute(.font, value: UIFont.font(.head_bold_20), range: NSRange(location: newlineRange.location + 1, length: fullText.count - (newlineRange.location + 1)))
        
        label.attributedText = attributedText
        
        label.numberOfLines = 0
        
        return label
    }()
    
    private let viewAllLabel: NPLabel = {
        let label = NPLabel(font: .font(.body_regular_15), color: .grayscale_gray6)
        label.text = "전체보기"
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
            $0.width.equalTo(161)
            $0.height.equalTo(52)
            $0.top.equalToSuperview().offset(48)
        }
        
        viewAllLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-38)
            $0.top.equalToSuperview().offset(77)
            $0.leading.equalTo(titleLabel.snp.trailing).inset(-111)
            $0.width.equalTo(53)
        }
        
        icArrow.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-43)
            $0.leading.equalTo(viewAllLabel.snp.trailing).inset(-3)
            $0.width.equalTo(4)
            $0.height.equalTo(8)
        }
    }
}
