//
//  PointCardCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/23.
//

import UIKit
final class CardCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "CardCollectionViewCell"
    
    private let cardBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
         imageView.image = ImageLiterals.PointView.pointCardBackgroud
         imageView.contentMode = .scaleToFill
         
         return imageView
     }()
    
    private let pointCardLabel = NPLabel(font: .font(.number_bold_27), color: .bg_white)
    
    private let pointScheduledButton: UIButton = {
       let button = UIButton()
        button.setTitle("적립 예정 : 0원", for: .normal)
        button.titleLabel?.font = UIFont.font(.detail_medium_14)
        button.setTitleColor(.bg_white, for: .normal)
        button.contentEdgeInsets = .init(top: 9, left: 14, bottom: 9, right: 14)
        button.backgroundColor = .graph_review
        button.makeCornerRound(radius: 18)
       
        return button
    }()
    
    private let lineView: UIView = {
       let view = UIView()
        view.backgroundColor = .grayscale_gray3
        
        return view
    }()
    
    
    private let horizonButtonStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 11
        
        return stackView
    }()
    
    private let pointButton1: UIButton = {
       let button = UIButton()
        button.setTitle("포인트 전환", for: .normal)
        button.setImage(ImageLiterals.PointView.epRefresh, for: .normal)
        button.titleLabel?.font = UIFont.font(.detail_medium_14)
        button.setTitleColor(.bg_white, for: .normal)
        button.contentEdgeInsets = .init(top: 14, left: 34, bottom: 14, right: 34)
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button.imageEdgeInsets = .init(top: 0, left: -2, bottom: 0, right: 2)
        button.titleEdgeInsets = .init(top: 0, left: 2, bottom: 0, right: -2)
        button.makeCornerRound(radius: 10)
        button.makeBorder(width: 1, color: .sub_darkgreen)
        
        return button
    }()
     
    private let pointButton2: UIButton = {
       let button = UIButton()
        button.setTitle("포인트 선물", for: .normal)
        button.setImage(ImageLiterals.PointView.giftIco, for: .normal)
        button.titleLabel?.font = UIFont.font(.detail_medium_14)
        button.setTitleColor(.bg_white, for: .normal)
        button.contentEdgeInsets = .init(top: 14, left: 34, bottom: 14, right: 34)
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button.imageEdgeInsets = .init(top: 0, left: -2, bottom: 0, right: 2)
        button.titleEdgeInsets = .init(top: 0, left: 2, bottom: 0, right: -2)
        button.makeCornerRound(radius: 10)
        button.makeBorder(width: 1, color: .sub_darkgreen)
        
        return button
    }()
     
    private let moneyView: UIView = {
        let view = UIView()
        view.backgroundColor = .bg_white
        
        return view
    }()
    
    private let horizonLabelStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let moneyLabel = NPLabel(font: UIFont.font(.detail_semibold_14), color: .grayscale_gray6)
    private let pointMoneyLabel = NPLabel(font: UIFont.font(.detail_semibold_14), color: .grayscale_gray6)
    
    
     override init(frame: CGRect) {
         super.init(frame: frame)
         
         setStyle()
         setLayout()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
    private func setStyle(){
        pointCardLabel.text = "11,500원"
        moneyLabel.text = "머니 내역"
        moneyLabel.textAlignment = .center
        pointMoneyLabel.text = "포인트+머니 내역"
        pointMoneyLabel.textAlignment = .center
    }
     private func setLayout() {
        
         contentView.addSubviews(cardBackgroundImageView, pointCardLabel, pointScheduledButton, horizonButtonStackView, moneyView)
         
         cardBackgroundImageView.snp.makeConstraints{
             $0.top.leading.trailing.equalToSuperview()
         }
         
         pointCardLabel.snp.makeConstraints{
             $0.top.equalTo(cardBackgroundImageView.snp.top).offset(44)
             $0.centerX.equalToSuperview()
         }
         
         pointScheduledButton.snp.makeConstraints{
             $0.top.equalTo(pointCardLabel.snp.bottom).offset(8)
             $0.centerX.equalToSuperview()
             
         }
         
         horizonButtonStackView.snp.makeConstraints{
             $0.top.equalTo(pointScheduledButton.snp.bottom).offset(27)
             $0.centerX.equalToSuperview()
         }
         horizonButtonStackView.addArrangedSubviews(pointButton1, pointButton2)
         
         moneyView.snp.makeConstraints{
             $0.top.equalTo(cardBackgroundImageView.snp.bottom)
             $0.bottom.leading.trailing.equalToSuperview()
         }
         
         moneyView.addSubviews(horizonLabelStackView)

         horizonLabelStackView.addArrangedSubviews(moneyLabel, lineView, pointMoneyLabel)
         
         horizonLabelStackView.snp.makeConstraints {
             $0.edges.equalToSuperview()
         }
         
         moneyLabel.snp.makeConstraints {
             $0.width.equalTo((contentView.bounds.width-1)/2)
         }
         
         pointMoneyLabel.snp.makeConstraints {
             $0.width.equalTo((contentView.bounds.width-1)/2)
         }
         
         lineView.snp.makeConstraints {
             $0.width.equalTo(1)
             $0.height.equalTo(moneyLabel.snp.height)
             $0.centerY.equalToSuperview()
         }
         
//         pointMoneyLabel.snp.makeConstraints {
//             $0.centerX.equalTo(lineView.snp.trailing)
//             $0.centerY.equalToSuperview()
//         }
         
         
     }
}
