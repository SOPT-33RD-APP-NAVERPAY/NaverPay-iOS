//
//  PointCardCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/23.
//

import UIKit

final class CardCollectionViewCell: UICollectionViewCell {
    static let identifier:String = "CardCollectionViewCell"
    
    private let cardBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
         imageView.image = ImageLiterals.PointView.pointCardBackgroud
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
         
         [cardBackgroundImageView].forEach{
             self.contentView.addSubview($0)
         }
         
         cardBackgroundImageView.snp.makeConstraints{
             $0.top.leading.trailing.equalToSuperview()
             
         }
         
     }
}
