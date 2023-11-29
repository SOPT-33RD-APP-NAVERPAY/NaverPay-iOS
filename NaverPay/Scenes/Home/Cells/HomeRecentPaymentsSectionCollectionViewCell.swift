//
//  MainRecentPaymentsCollectionViewCell.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomeRecentPaymentsSectionCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HomeRecentPaymentsSectionCollectionViewCell"
    
    var homeDataAppData: HomeOnsitePaymentData? {
        didSet {
            guard let data = homeDataAppData else { return }
            paidAmountLabel.text = "-\(data.amount.formattedString())원"
            storeNameLabel.text = data.name
            Task {
                let image = try await NPKingFisherService.fetchImage(with: data.logoImgURL)
                logoImageView.image = image
            }
        }
    }
    
    private let paidAmountLabel: NPLabel = {
        let label = NPLabel(font: .font(.head_bold_20), color: .bg_black)
        label.text = "-25,000원"
        return label
    }()
    
    private let storeNameLabel: NPLabel = {
        let label = NPLabel(font: .font(.body_smbold_16), color: .bg_black)
        label.text = "GS25 건대점"
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.MainView.logoGs25
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubviews(paidAmountLabel,storeNameLabel,logoImageView)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(34)
            $0.leading.equalToSuperview().offset(21)
            $0.width.equalTo(60)
            $0.height.equalTo(19)
        }
        storeNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.bottom.equalToSuperview().offset(-32)
            $0.leading.equalTo(logoImageView.snp.trailing).inset(-16)
            $0.width.equalTo(112)
        }
        paidAmountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(31)
            $0.bottom.equalToSuperview().offset(-31)
            $0.leading.equalTo(storeNameLabel.snp.trailing).inset(-19)
            $0.trailing.equalToSuperview().inset(18)
        }
    }
    
    private func setStyle() {
        self.layer.cornerRadius = 6
        self.backgroundColor = .bg_white
    }
}
