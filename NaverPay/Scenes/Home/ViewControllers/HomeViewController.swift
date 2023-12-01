//
//  MainViewController.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    private var homeDataAppData: HomeDataAppData? {
        didSet {
            HomeCollectionView.reloadData()
        }
    }
    private let homeEventData = HomeEventData.dummy()
    private var homeCardData = HomeCardData.dummy()
    
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
        setStyle()
        getHomeData()
    }
    
    private func setStyle() {
        view.backgroundColor = .bg_black
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setLayout() {
        view.addSubviews(HomeCollectionView, homeHeaderView)
        
        homeHeaderView.snp.makeConstraints {
            $0.top.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(54)
        }
        
        HomeCollectionView.snp.makeConstraints {
            $0.top.equalTo(homeHeaderView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(21)
        }
    }
    
    private func setCollectionView() {
        HomeCollectionView.dataSource = self
        HomeCollectionView.delegate = self
        
        HomeCollectionView.register(HomePointSectionCollectionViewCell.self, forCellWithReuseIdentifier: HomePointSectionCollectionViewCell.identifier)
        HomeCollectionView.register(HomeRecentPaymentsSectionCollectionViewCell.self, forCellWithReuseIdentifier: HomeRecentPaymentsSectionCollectionViewCell.identifier)
        HomeCollectionView.register(HomePlaceSectionCollectionViewCell.self, forCellWithReuseIdentifier: HomePlaceSectionCollectionViewCell.identifier)
        HomeCollectionView.register(HomeEventSectionCollectionViewCell.self, forCellWithReuseIdentifier: HomeEventSectionCollectionViewCell.identifier)
        HomeCollectionView.register(HomeSwitchSectionCollectionViewCell.self, forCellWithReuseIdentifier: HomeSwitchSectionCollectionViewCell.identifier)
        
        HomeCollectionView.register(HomePointSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomePointSectionHeaderView.identifier)
        HomeCollectionView.register(HomeRecentPaymentsSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeRecentPaymentsSectionHeaderView.identifier)
        HomeCollectionView.register(HomePlaceSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomePlaceSectionHeaderView.identifier)
        HomeCollectionView.register(HomeEventSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeEventSectionHeaderView.identifier)
        HomeCollectionView.register(HomePointSectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HomePointSectionFooterView.identifier)
        HomeCollectionView.register(HomePlaceSectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HomePlaceSectionFooterView.identifier)
    }
    
    static func setCollectionViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
                
            case 0:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(60)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(60)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                return section
                
            case 1:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(76), heightDimension: .absolute(56)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.5), heightDimension: .absolute(91)), subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 16, bottom: 24, trailing: 0)
                group.interItemSpacing = .fixed(14)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(178))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: HomePointSectionBackgroundView.identifier)
                section.decorationItems = [sectionBackgroundDecoration]
                
                let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(52))
                let footer = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: UICollectionView.elementKindSectionFooter,
                    alignment: .bottom
                )
                section.boundarySupplementaryItems = [footer, header]
                
                return section
                
                
            case 2:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(88)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(88)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(97))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.boundarySupplementaryItems = [header]
                
                return section
                
            case 3:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(52)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(260)), subitems: [item])
                group.interItemSpacing = .fixed(16)
                let section = NSCollectionLayoutSection(group: group)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(133))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(78))
                let footer = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: UICollectionView.elementKindSectionFooter,
                    alignment: .bottom
                )
                section.boundarySupplementaryItems = [header,footer]
                
                return section
                
                
                
            case 4:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(248), heightDimension: .absolute(84)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(256*3), heightDimension: .absolute(155)), subitems: [item])
                group.interItemSpacing = .fixed(8)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(106))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
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

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            for index in 0..<homeCardData.count {
                homeCardData[index].isSelected = false
            }
            homeCardData[indexPath.item].isSelected = true
            collectionView.reloadSections(IndexSet(integer: 1))
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return homeCardData.count
        case 2:
            return 1
        case 3:
            return homeDataAppData?.brandList.count ?? 4
        default:
            return homeEventData.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
            case 1:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomePointSectionHeaderView.identifier, for: indexPath) as? HomePointSectionHeaderView else { return UICollectionReusableView() }
                
                header.homeDataAppData = self.homeDataAppData
                return header
                
            case 2:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeRecentPaymentsSectionHeaderView.identifier, for: indexPath) as? HomeRecentPaymentsSectionHeaderView else { return UICollectionReusableView() }
                
                header.homeDataAppData = self.homeDataAppData
                return header
                
            case 3:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomePlaceSectionHeaderView.identifier, for: indexPath) as? HomePlaceSectionHeaderView else { return UICollectionReusableView() }
                header.delegate = self
                return header
                
            case 4:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeEventSectionHeaderView.identifier, for: indexPath) as? HomeEventSectionHeaderView else { return UICollectionReusableView() }
                return header
                
            default:
                return UICollectionReusableView()
            }
            
        case UICollectionView.elementKindSectionFooter:
            switch indexPath.section {
            case 1:
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomePointSectionFooterView.identifier, for: indexPath) as? HomePointSectionFooterView else { return UICollectionReusableView() }
                return footer
            case 3:
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
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSwitchSectionCollectionViewCell.identifier, for: indexPath) as? HomeSwitchSectionCollectionViewCell else { return UICollectionViewCell()}
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePointSectionCollectionViewCell.identifier, for: indexPath) as? HomePointSectionCollectionViewCell else { return UICollectionViewCell()}
            cell.homeCardData = self.homeCardData[indexPath.item]
            
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRecentPaymentsSectionCollectionViewCell.identifier, for: indexPath) as? HomeRecentPaymentsSectionCollectionViewCell else { return UICollectionViewCell() }
            cell.homeDataAppData = self.homeDataAppData?.onsitePayment
            
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePlaceSectionCollectionViewCell.identifier, for: indexPath) as? HomePlaceSectionCollectionViewCell else { return UICollectionViewCell() }
            cell.homeDataAppData = self.homeDataAppData?.brandList[indexPath.item]
            
            return cell
            
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeEventSectionCollectionViewCell.identifier, for: indexPath) as? HomeEventSectionCollectionViewCell else { return UICollectionViewCell() }
            cell.homeEventData = self.homeEventData[indexPath.item]
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}

extension HomeViewController: HomeViewPushDelegate {
    func didTapButton() {
        let placeViewController = PlaceViewController()
        self.navigationController?.pushViewController(placeViewController, animated: true)
    }
}

extension HomeViewController {
    func getHomeData() {
        Task {
            do {
                let homeData = try await HomeService.shared.getHomeInfo()
                homeDataAppData = homeData
            }
            catch {
                guard error is NetworkError else { return }
            }
        }
    }
}
