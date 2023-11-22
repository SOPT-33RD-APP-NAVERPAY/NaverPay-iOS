//
//  BrandCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/21.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {
    static let identifier:String = "BrandCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [label].forEach{
            self.contentView.addSubview($0)
        }
        
        label.snp.makeConstraints{
            $0.top.leading.equalToSuperview().inset(4)
        }
    }
    
    private let label:UILabel = {
       let label = UILabel()
        label.text = "Brand"
        label.font = UIFont.font(.body_bold_15)
        label.textColor = .main_darkgreen3
        return label
    }()
}
