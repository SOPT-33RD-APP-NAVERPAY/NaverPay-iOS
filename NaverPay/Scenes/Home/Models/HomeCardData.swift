//
//  HomeCardData.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/24.
//

import Foundation

import UIKit

struct HomeCardData {
    let cardImage: UIImage
    var isSelected: Bool
}

extension HomeCardData {
    static func dummy() -> [HomeCardData] {
        [
            HomeCardData(cardImage: ImageLiterals.MainView.imgNaverpayLogo, isSelected: true),
            HomeCardData(cardImage: ImageLiterals.MainView.imgCard3, isSelected: false),
            HomeCardData(cardImage: ImageLiterals.MainView.imgCard2, isSelected: false),
            HomeCardData(cardImage: ImageLiterals.MainView.btnCardPlus, isSelected: false),
        ]
    }
}
