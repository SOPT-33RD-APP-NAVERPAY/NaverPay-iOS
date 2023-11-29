//
//  HomeRecentPaymentsSectionHeaderView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomeRecentPaymentsSectionHeaderView: UICollectionReusableView {
    static let identifier: String = "HomeRecentPaymentsSectionHeaderView"
    
    var homeDataAppData: HomeDataAppData? {
        didSet {
            guard let data = homeDataAppData else { return }
            dateLabel.text = formateDate(data.onsitePayment.paymentDate)
        }
    }
    
    private let icArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.icArrowGray
        return imageView
    }()
    
    private let recentPaymentLabel: NPLabel = {
        let label = NPLabel(font: .font(.head_bold_20), color: .bg_white)
        label.text = "최근 현장결제"
        return label
    }()
    
    private let dateLabel: NPLabel = {
        let label = NPLabel(font: .font(.body_smbold_16), color: .main_lightgreen)
        label.text = "11.16"
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
        self.addSubviews(icArrow, recentPaymentLabel, dateLabel, viewAllLabel )
        
        recentPaymentLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(51)
            $0.leading.equalToSuperview()
            $0.width.equalTo(110)
        }
        
        dateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-18)
            $0.top.equalToSuperview().offset(55)
            $0.leading.equalTo(recentPaymentLabel.snp.trailing).inset(-7)
            $0.width.equalTo(39)
        }
        
        viewAllLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-24)
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalTo(dateLabel.snp.trailing).inset(-124)
            $0.width.equalTo(53)
        }
        
        icArrow.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-29)
            $0.leading.equalTo(viewAllLabel.snp.trailing).inset(-3)
            $0.width.equalTo(4)
            $0.height.equalTo(8)
        }
    }
    
    private func formateDate(_ string: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let date = formatter.date(from: string) {
            formatter.dateFormat = "MM.dd"
            return formatter.string(from: date)
        }
        else {
            return "Invalid Date"
        }
        
    }
}
