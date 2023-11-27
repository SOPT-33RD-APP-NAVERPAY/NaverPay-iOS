//
//  GraphCollectionViewCell.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/23.
//

import UIKit

final class GraphCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "GraphCollectionViewCell"
    
    private let monthStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 3
        
        return stackView
    }()
    
    private let monthLabel = NPLabel(font: UIFont.font(.subtitle_bold_17), color: .bg_black)
    private let descLabel = NPLabel(font: UIFont.font(.detail_regular_14), color: .grayscale_gray6)
    
    private let downArrowIcon: UIImageView = {
       let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.downArrow
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    private let upArrowIcon: UIImageView = {
       let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.upArrow
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    private let leftArrowIcon: UIImageView = {
       let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.leftArrow
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    private let rightArrowIcon: UIImageView = {
       let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.rightArrow
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    private let alertBanner: UIImageView = {
       let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.alertBanner
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()

    private let graphView: UIView = {
       let view = UIView()
        view.makeCornerRound(radius: 15)
        view.makeBorder(width: 1, color: .grayscale_gray3)
        
        return view
    }()
    
    private let totalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        
        return stackView
    }()
    
    private let helpIcon: UIImageView = {
       let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.helpIcon
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    private let totalLabel = NPLabel(font: .font(.body_smbold_16), color: .sub_black)
    private let amountLabel = NPLabel(font: .font(.subtitle_bold_17), color: .sub_black)
    
    private let amountStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        
        return stackView
    }()
    
    private let graphImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.donutChartDummy
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
//    private let pieChartView: PieChartView = {
//       let view = PieChartView()
//        view.backgroundColor = .adcard_orange
//        return view
//    }()
    
    
    let pieChartView = PieChartView(frame: .init(origin: .zero, size: .init(width: 100,
                                                                            height: 100)))

    
    private let dateLabel = NPLabel(font: .font(.detail_smbold_12), color: .grayscale_gray6)
    
    private let categoryFirstButton: UIButton = {
       let button = UIButton()
        button.setTitle("전체", for: .normal)
        button.titleLabel?.font = UIFont.font(.detail_semibold_14)
        button.setTitleColor(.bg_white, for: .normal)
        button.contentEdgeInsets = .init(top: 10, left: 16, bottom: 10, right: 16)
        button.backgroundColor = .sub_navy
        button.makeCornerRound(radius: 18)
        return button
    }()
    
    private let categorySecondButton: UIButton = {
       let button = UIButton()
        button.setTitle("적립", for: .normal)
        button.titleLabel?.font = UIFont.font(.detail_semibold_14)
        button.setTitleColor(.grayscale_gray6, for: .normal)
        button.contentEdgeInsets = .init(top: 10, left: 16, bottom: 10, right: 16)
        button.backgroundColor = .bg_white
        button.makeCornerRound(radius: 18)
        button.makeBorder(width: 1, color: .grayscale_gray3)
        return button
    }()
    
    private let categoryThirdButton: UIButton = {
       let button = UIButton()
        button.setTitle("사용", for: .normal)
        button.titleLabel?.font = UIFont.font(.detail_semibold_14)
        button.setTitleColor(.grayscale_gray6, for: .normal)
        button.contentEdgeInsets = .init(top: 10, left: 16, bottom: 10, right: 16)
        button.backgroundColor = .bg_white
        button.makeCornerRound(radius: 18)
        button.makeBorder(width: 1, color: .grayscale_gray3)
        return button
    }()
    
    private let categoryStackView: UIStackView = {
        let stackView = UIStackView()
         stackView.axis = .horizontal
         stackView.spacing = 8
         
         return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        contentView.backgroundColor = .bg_white
        monthLabel.text = "11월"
        descLabel.text = "이달에는 결제수단 혜택을 많이 받았어요"
        totalLabel.text = "총 적립 혜택"
        amountLabel.text = "11,500원"
        dateLabel.text = "2023.11.01. \n~ 11.30."
        dateLabel.numberOfLines = 2
        dateLabel.textAlignment = .center
        
        self.contentView.addSubview(pieChartView)
        pieChartView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }

        pieChartView.progressAnimation(duration: 0.5, value: 1)
    }
    
    private func setLayout() {
        contentView.addSubviews(monthStackView,leftArrowIcon, rightArrowIcon, descLabel, graphView, categoryStackView, alertBanner)
        
        monthStackView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(30)
            $0.centerX.equalToSuperview()
        }
        
        monthStackView.addArrangedSubviews(monthLabel, downArrowIcon)
        
        downArrowIcon.snp.makeConstraints {
            $0.width.height.equalTo(18)
        }
        
        leftArrowIcon.snp.makeConstraints{
            $0.top.equalToSuperview().inset(32)
            $0.leading.equalToSuperview().inset(16)
        }
        
        rightArrowIcon.snp.makeConstraints{
            $0.top.equalToSuperview().inset(32)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        descLabel.snp.makeConstraints{
            $0.top.equalTo(monthStackView.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
        }
        
        graphView.snp.makeConstraints{
            $0.top.equalTo(descLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(300)
            
        }
        
        graphView.addSubviews(totalStackView, amountStackView, pieChartView)
        
        totalStackView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(23)
            $0.leading.equalToSuperview().inset(19)
        }
        
        totalStackView.addArrangedSubviews(totalLabel, helpIcon)
        
        amountStackView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(23)
            $0.trailing.equalToSuperview().inset(19)
        }
        
        amountStackView.addArrangedSubviews(amountLabel, upArrowIcon)
        
        pieChartView.snp.makeConstraints{
            $0.top.equalTo(amountStackView.snp.bottom).offset(8)
            $0.height.equalTo(100)
            $0.width.equalTo(100)
            $0.centerX.equalToSuperview()
        }
        
        categoryStackView.snp.makeConstraints{
            $0.top.equalTo(graphView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(22)
        }
        
        categoryStackView.addArrangedSubviews(categoryFirstButton, categorySecondButton, categoryThirdButton)
        
        alertBanner.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        graphImageView.addSubviews(dateLabel)
        
        dateLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
    }
    
}
