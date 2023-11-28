//
//  NaverNavigationBar.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/28.
//
import UIKit

import SnapKit

final class NaverNavigationBar: UIView {
    @frozen
    enum NavigationBarType {
        case place
        case point
    }

    private lazy var arrowButton: UIButton = {
        var button = UIButton()
        button.setImage(ImageLiterals.Global.placeBtnBack, for: .normal)
        button.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)

        return button
    }()

    private let nLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.logoIc
        return imageView
    }()

    private let benefitImgae: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.PointView.pointIcBnf
        return imageView
    }()

    private let pointLabel: NPLabel = {
        let label = NPLabel(font: .font(.subtitle_bold_17), color: .sub_black)
        label.text = "포인트"
        return label
    }()

    private let titleLabel: NPLabel = {
        let label = NPLabel(font: .font(.subtitle_bold_17), color: .bg_black)
        label.text = "현장결제 장소"
        return label
    }()

    private weak var viewController: UIViewController?
    private let type: NavigationBarType

    init(_ viewController: UIViewController, leftItem type: NavigationBarType) {
        self.viewController = viewController
        self.type = type
        super.init(frame: .zero)
        setLayout()
        self.backgroundColor = .bg_white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NaverNavigationBar {
    func setLayout() {
        switch type {
        case .place:
            [arrowButton, titleLabel].forEach {
                addSubview($0)
            }

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

        case .point:
            self.addSubviews(arrowButton, nLogoImage, pointLabel, benefitImgae)

            arrowButton.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(20)
                $0.size.equalTo(24)
                $0.top.equalToSuperview().offset(15)
            }

            nLogoImage.snp.makeConstraints {
                $0.leading.equalTo(arrowButton.snp.trailing).inset(-89)
                $0.height.equalTo(18)
                $0.width.equalTo(54)
                $0.top.equalToSuperview().offset(24)
            }

            pointLabel.snp.makeConstraints {
                $0.leading.equalTo(nLogoImage.snp.trailing).inset(-8)
                $0.height.equalTo(20)
                $0.width.equalTo(45)
                $0.top.equalToSuperview().offset(23)
            }

            benefitImgae.snp.makeConstraints {
                $0.leading.equalTo(pointLabel.snp.trailing).inset(-61)
                $0.height.equalTo(25)
                $0.width.equalTo(56)
                $0.top.equalToSuperview().offset(20)
            }
        }
    }

}

extension NaverNavigationBar {
    @objc
    private func arrowButtonTapped() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
}
