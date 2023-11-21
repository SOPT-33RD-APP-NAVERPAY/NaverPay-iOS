//
//  MainViewController.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    private let HomeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setCollectionViewLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .bg_black
        return collectionView
    }()
    
    private let homeHeaderView = HomeHeaderView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setCollectionView()
    }
    
    
    
    private func setLayout() {
        view.addSubviews(HomeCollectionView, homeHeaderView)
        
        homeHeaderView.snp.makeConstraints {
            $0.top.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(54)
        }
        
        HomeCollectionView.snp.makeConstraints {
            $0.top.equalTo(homeHeaderView.snp.bottom)
            $0.trailing.leading.bottom.equalToSuperview().inset(21)
        }
        
    }
    
    private func setCollectionView() {
        HomeCollectionView.dataSource = self
        HomeCollectionView.delegate = self
        
        HomeCollectionView.register(HomePointSectionCollectionViewCell.self, forCellWithReuseIdentifier: HomePointSectionCollectionViewCell.identifier)
        HomeCollectionView.register(HomeRecentPaymentsSectionCollectionViewCell.self, forCellWithReuseIdentifier: HomeRecentPaymentsSectionCollectionViewCell.identifier)
        HomeCollectionView.register(HomePlaceSectionCollectionViewCell.self, forCellWithReuseIdentifier: HomePlaceSectionCollectionViewCell.identifier)
        HomeCollectionView.register(HomeEventSectionCollectionViewCell.self, forCellWithReuseIdentifier: HomeEventSectionCollectionViewCell.identifier)
        
        HomeCollectionView.register(HomePointSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomePointSectionHeaderView.identifier)
        HomeCollectionView.register(HomeRecentPaymentsSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeRecentPaymentsSectionHeaderView.identifier)
        HomeCollectionView.register(HomePlaceSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomePlaceSectionHeaderView.identifier)
        HomeCollectionView.register(HomeEventSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeEventSectionHeaderView.identifier)
        HomeCollectionView.register(HomePlaceSectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HomePlaceSectionFooterView.identifier)
    }
    
    static func setCollectionViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            case 0:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(400), heightDimension: .absolute(389)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .estimated(1)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 20, trailing: 0)
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(66))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                header.pinToVisibleBounds = false
                section.boundarySupplementaryItems = [header]
                
                let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: HomePointSectionBackgroundView.identifier)
                sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
                section.decorationItems = [sectionBackgroundDecoration]
                
                return section
                
            case 1:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(55), heightDimension: .absolute(100)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .estimated(1)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 20, trailing: 0)
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(66))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                header.pinToVisibleBounds = true
                section.boundarySupplementaryItems = [header]
                
                return section
                
            case 2:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(55), heightDimension: .estimated(50)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .absolute(400)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 20, trailing: 0)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(66))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                header.pinToVisibleBounds = true
                section.boundarySupplementaryItems = [header]

                let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(66))
                let footer = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: UICollectionView.elementKindSectionFooter,
                    alignment: .top
                )
                footer.pinToVisibleBounds = true
                section.boundarySupplementaryItems = [footer]

                return section


                
            case 3:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(55), heightDimension: .absolute(100)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .estimated(1)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 20, trailing: 0)
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(66))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                header.pinToVisibleBounds = true
                section.boundarySupplementaryItems = [header]
                
                return section
                
            default:
                return nil
            }
        }
        layout.register(HomePointSectionBackgroundView.self, forDecorationViewOfKind: HomePointSectionBackgroundView.identifier)
        return layout
    }
}

extension HomeViewController: UICollectionViewDelegate { }
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 1
        case 2:
            return 4
        default:
            return 3
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
            case 0:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomePointSectionHeaderView.identifier, for: indexPath) as? HomePointSectionHeaderView else { return UICollectionReusableView() }
                return header
                
            case 1:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeRecentPaymentsSectionHeaderView.identifier, for: indexPath) as? HomeRecentPaymentsSectionHeaderView else { return UICollectionReusableView() }
                return header
                
            case 2:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomePlaceSectionHeaderView.identifier, for: indexPath) as? HomePlaceSectionHeaderView else { return UICollectionReusableView() }
                return header
                
            case 3:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeEventSectionHeaderView.identifier, for: indexPath) as? HomeEventSectionHeaderView else { return UICollectionReusableView() }
                return header
                
            default:
                return UICollectionReusableView()
            }
            
        case UICollectionView.elementKindSectionFooter: // Corrected element kind for footer
            switch indexPath.section {
            case 2:
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomePlaceSectionFooterView.identifier, for: indexPath) as? HomePlaceSectionFooterView else { return UICollectionReusableView() }
                return footer
                
            default:
                return UICollectionReusableView()
            }
            
        default:
            return UICollectionReusableView()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePointSectionCollectionViewCell.identifier, for: indexPath) as? HomePointSectionCollectionViewCell else { return UICollectionViewCell()}
            
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRecentPaymentsSectionCollectionViewCell.identifier, for: indexPath) as? HomeRecentPaymentsSectionCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePlaceSectionCollectionViewCell.identifier, for: indexPath) as? HomePlaceSectionCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeEventSectionCollectionViewCell.identifier, for: indexPath) as? HomeEventSectionCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }
}
