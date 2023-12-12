//
//  BenefitSectionLayout.swift
//  NaverPay
//
//  Created by 곽성준 on 12/12/23.
//


import UIKit

final class BenefitSectionLayout {
        
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
            
        case .adBanner:
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: delegate.groupSize, subitems: [item])
            section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .paging

        }

        if let headerSize = delegate.headerSize {
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [header]
        }
        
        if let footerSize = delegate.footerSize {
            let footer = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: footerSize,
                elementKind: UICollectionView.elementKindSectionFooter,
                alignment: .bottom
            )
            
            if delegate.section == .adBanner {
                footer.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
                section.boundarySupplementaryItems = [footer]
            } else {
                section.boundarySupplementaryItems.append(footer)

            }
            
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

