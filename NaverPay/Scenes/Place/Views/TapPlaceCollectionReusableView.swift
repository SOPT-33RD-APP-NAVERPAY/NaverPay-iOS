//
//  TapPlaceCollectionReusableView.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/23.
//

import UIKit
import SnapKit

class TapPlaceCollectionReusableView: UICollectionReusableView {
        
    static let identifier:String = "TapPlaceCollectionReusableView"
    
    let tapPlaceLabel1: UILabel = {
       let label = UILabel()
        label.text = "국내"
        label.font = UIFont.font(.subtitle_smbold_18)
        label.textColor = .bg_black
        return label
    }()
    
    let tapPlaceLabel2: UILabel = {
       let label = UILabel()
        label.text = "해외"
        label.font = UIFont.font(.subtitle_smbold_18)
        label.textColor = .grayscale_gray4
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }

    private func setLayout() {
        
        [tapPlaceLabel1, tapPlaceLabel2].forEach{
            addSubviews($0)
        }
        
        tapPlaceLabel1.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        tapPlaceLabel2.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(tapPlaceLabel1.snp.trailing).offset(20)
        }
    }
}
