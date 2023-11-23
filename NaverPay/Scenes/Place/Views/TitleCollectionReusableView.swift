//
//  TitleCollectionReusableView.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/21.
//

import UIKit

final class TitleCollectionReusableView: UICollectionReusableView {
    static let identifier:String = "TitleCollectionReusableView"
    
    let headerLabel: UILabel = {
       let label = UILabel()
        label.text = "Header"
        label.font = UIFont.font(.head_bold_20)
        label.numberOfLines = 2
        return label
    }()

    let headerButton: UIButton = {
        let button = UIButton()
        button.setTitle("button", for: .normal)
        button.titleLabel?.font = UIFont.font(.detail_semibold_14)
        button.setTitleColor(.bg_white, for: .normal)
        button.contentEdgeInsets = .init(top: 8, left: 10, bottom: 8, right: 10)
        button.layer.cornerRadius = 16
    
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
        
    private func setLayout() {
        
        [headerLabel, headerButton].forEach{
            addSubviews($0)
        }
        
        headerLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        headerButton.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
}
