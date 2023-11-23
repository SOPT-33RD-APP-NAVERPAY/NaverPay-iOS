//
//  GraphCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/23.
//

import UIKit

class GraphCollectionViewCell: UICollectionViewCell {
    static let identifier:String = "GraphCollectionViewCell"
    
    private let alertBanner: UIImageView = {
       let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.alertBanner
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        [alertBanner].forEach{
            self.contentView.addSubview($0)
        }
        
        alertBanner.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
    }
    
}
