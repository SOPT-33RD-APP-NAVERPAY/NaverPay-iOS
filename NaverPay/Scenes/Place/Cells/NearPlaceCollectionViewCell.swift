//
//  NearPlaceCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/21.
//

import UIKit

class NearPlaceCollectionViewCell: UICollectionViewCell {
    static let identifier:String = "NearPlaceCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
    
    private let placeImageView:UIImageView = {
        let imageVIew = UIImageView()
        
        return imageVIew
    }()
    
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
        label.text = "NearPlace"
        label.font = UIFont.font(.body_bold_15)
        label.textColor = .adcard_orange
        return label
    }()
}


