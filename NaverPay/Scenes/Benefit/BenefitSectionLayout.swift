//
//  BenefitSectionLayout.swift
//  NaverPay
//
//  Created by 곽성준 on 12/12/23.
//


import UIKit

/// compositional 의 section class
/// class 생성 시 WeatherDetailSectionTypeProtocol을 준수하는 SectionType을 지정해줘야 함
/// fetchLayoutSection을 통해 section을 반환할 수 있으며, fetchNormalHeaderModel을 통해 section의 headerModel을반환할 수 있음
///
final class WeatherDetailSection {
        
    var delegate: BenefitSectionTypeProtocol
    
    init(delegate: BenefitSectionTypeProtocol) {
        self.delegate = delegate
    }
    
    func fetchLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: delegate.itemSize)
        let section: NSCollectionLayoutSection
        
        switch delegate.section {
        case .pointCheck:
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: -10)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: delegate.groupSize, subitems: [item])
            section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 0, leading: 0, bottom: 36, trailing: 0)
            section.orthogonalScrollingBehavior = .continuous

        case .famousBenefit:
            let group = NSCollectionLayoutGroup.vertical(layoutSize: delegate.groupSize, subitems: [item])
            section = NSCollectionLayoutSection(group: group)
            
        case .pointCategory:
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: delegate.groupSize, subitems: [item])
            group.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)
            section = NSCollectionLayoutSection(group: group)
            
        case .entireBenefit:
            let group = NSCollectionLayoutGroup.vertical(layoutSize: delegate.groupSize, subitems: [item])
            section = NSCollectionLayoutSection(group: group)
        }

        if let headerSize = delegate.headerSize {
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            //여기서 헤더를 추가하고 아래에서 푸터를 저런 식으로 추가해도 되는 지 모르겠음
            section.boundarySupplementaryItems = [header]
        }
        
        if let footerSize = delegate.footerSize {
            let footer = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: footerSize,
                elementKind: UICollectionView.elementKindSectionFooter,
                alignment: .bottom
            )
            section.boundarySupplementaryItems.append(footer)
        }
        
        if let identifier = delegate.backgroundViewIdentifier {
            let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: identifier)
            section.decorationItems = [sectionBackgroundDecoration]
        }
       
        return section
    }
    
//    func fetchNormalHeaderModel() -> WeatherDetailSectionHeaderModel? {
//        return delegate.headerNormalModel
//    }
}

