//
//  MainPointSectionCollectionViewCell.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

final class HomePointSectionCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HomePointSectionCollectionViewCell"
    private var isChoosen: Bool = false
    
    var homeCardData: HomeCardData? {
        didSet {
            guard let data = homeCardData else { return }
            cardImageView.image = data.cardImage
            isChoosen = data.isSelected
            
            icDownView.image = isChoosen ? ImageLiterals.MainView.icDown : nil
            borderView.makeBorder(width: 1, color: isChoosen ? .main_lightgreen : .grayscale_gray4)
        }
    }
    
    private let cardImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let icDownView: UIImageView = {
        let icDownView = UIImageView()
        return icDownView
    }()
    
    private let borderView: UIView = {
        let border = UIView()
        border.makeCornerRound(radius: 4)
        border.backgroundColor = .bg_black
        return border
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubviews(borderView,icDownView,cardImageView)
        
        cardImageView.snp.makeConstraints {
            $0.centerX.centerY.equalTo(borderView.snp.center)
        }
        borderView.snp.makeConstraints {
            $0.bottom.trailing.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(11)
        }
        icDownView.snp.makeConstraints {
            $0.height.equalTo(7)
            $0.width.equalTo(8)
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(34)
        }
    }
}
