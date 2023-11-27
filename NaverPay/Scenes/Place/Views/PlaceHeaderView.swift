//
//  PlaceHeaderView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/27.
//

import UIKit

final class PlaceHeaderView: UIView,UIGestureRecognizerDelegate {
    static let identifier: String = "PlaceHeaderView"
    
    weak var viewController: UIViewController?
    
    private let titleLabel: NPLabel = {
        let label = NPLabel(font: .font(.subtitle_bold_17), color: .bg_black)
        label.text = "현장결제 장소"
        return label
    }()
    
    private lazy var arrowButton: UIButton = {
        var button = UIButton()
        button.setImage(ImageLiterals.Global.placeBtnBack, for: .normal)
        button.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
        super.init(frame: .zero)
        setStyle()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .clear
    }
    
    private func setLayout() {
        self.addSubviews(arrowButton,titleLabel)
        
        arrowButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(24)
            $0.top.equalToSuperview().offset(15)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(arrowButton.snp.trailing).inset(-97)
            $0.height.equalTo(20)
            $0.width.equalTo(93)
            $0.top.equalToSuperview().offset(19)
        }
    }
    
    @objc func arrowButtonTapped() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
    
}
