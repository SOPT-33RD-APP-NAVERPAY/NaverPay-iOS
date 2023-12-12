//
//  BenefitSectionType.swift
//  NaverPay
//
//  Created by 곽성준 on 12/12/23.
//

import UIKit

/// compositional layout의 cell 방향을 결정하기 위한 enum
enum Section {
    case pointCheck
    case famousBenefit
}

struct WeatherDetailSectionHeaderModel {
    let image: UIImage?
    let title: String
}

/// compositional layout을 만들기 위한 protocol
protocol BenefitSectionTypeProtocol {
    var itemSize: NSCollectionLayoutSize { get }
    var section: Section { get }
    var groupSize: NSCollectionLayoutSize { get }
    var headerSize: NSCollectionLayoutSize? { get }
    var footerSize: NSCollectionLayoutSize? { get }
    var backgroundViewIdentifier: String? { get }
//    var headerNormalModel: WeatherDetailSectionHeaderModel? { get }
}

struct PointCheckSectionType: BenefitSectionTypeProtocol {
    var itemSize: NSCollectionLayoutSize = .init(widthDimension: .absolute(105), heightDimension: .estimated(108))
    var groupSize: NSCollectionLayoutSize = .init(widthDimension: .fractionalWidth(1.3), heightDimension: .absolute(123))
    var headerSize: NSCollectionLayoutSize? = .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(73))
    var footerSize: NSCollectionLayoutSize?
    var section: Section = .pointCheck
    var backgroundViewIdentifier: String? = BenefitCollectionViewPointCheckSectionBackgroundView.identifier

//    var headerNormalModel: WeatherDetailSectionHeaderModel? =  WeatherDetailSectionHeaderModel(image: UIImage(systemName: "clock"), title: "시간별 일기예보")
}

struct FamousBenefitSectionType: BenefitSectionTypeProtocol {
    var itemSize: NSCollectionLayoutSize = .init(widthDimension: .absolute(343), heightDimension: .absolute(80))
    var groupSize: NSCollectionLayoutSize = .init(widthDimension: .absolute(343), heightDimension: .absolute(269))
    var headerSize: NSCollectionLayoutSize? = .init(widthDimension: .absolute(UIScreen.main.bounds.width - 40), heightDimension: .absolute(102))
    var footerSize: NSCollectionLayoutSize? = .init(widthDimension: .absolute(UIScreen.main.bounds.width - 32), heightDimension: .absolute(69))
    var section: Section = .famousBenefit
    var backgroundViewIdentifier: String? = BenefitCollectionViewFamousBenefitSectionBackgroundView.identifier

}
