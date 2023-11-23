//
//  TapPlaceCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/23.
//

import UIKit
import SnapKit

final class TapPlaceCollectionViewCell: UICollectionViewCell {
    
    static let identifier:String = "TapPlaceCollectionViewCell"
    
    private let tapPlaceLabel1: UILabel = {
       let label = UILabel()
        label.text = "국내"
        label.font = UIFont.font(.subtitle_smbold_18)
        label.textColor = .bg_black
        
        return label
    }()
    
    private let lineView:UIView = {
       let view = UIView()
        view.backgroundColor = .main_green
        return view
    }()
    
    private let tapPlaceLabel2: UILabel = {
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
        
        [tapPlaceLabel1, lineView, tapPlaceLabel2].forEach{
            addSubviews($0)
        }
        
        tapPlaceLabel1.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        lineView.snp.makeConstraints{
            $0.leading.equalTo(tapPlaceLabel1.snp.leading)
            $0.trailing.equalTo(tapPlaceLabel1.snp.trailing)
            $0.top.equalTo(tapPlaceLabel1.snp.bottom).offset(2)
            $0.height.equalTo(2)
        }
        
        tapPlaceLabel2.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(tapPlaceLabel1.snp.trailing).offset(20)
        }
    }
    
}
