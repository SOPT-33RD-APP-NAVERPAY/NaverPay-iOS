//
//  TitleCollectionReusableView.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/21.
//

import UIKit

class TitleCollectionReusableView: UICollectionReusableView {
    static let identifier:String = "TitleCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
        
    private func setLayout() {
        addSubviews(label)
        
        label.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    let label:UILabel = {
       let label = UILabel()
        label.text = "Header"
        label.font = UIFont.font(.head_bold_20)
        label.numberOfLines = 2
        return label
    }()
}
