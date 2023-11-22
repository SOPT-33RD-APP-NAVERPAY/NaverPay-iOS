//
//  BenefitViewController.swift
//  NaverPay
//
//  Created by 곽성준 on 11/21/23.
//

import UIKit
import SnapKit

final class BenefitViewController: UIViewController {
    
    private let userBenefitData = UserBenefitDataAppData.dummy()
    
    private let pointCellBackgroundViewList: [UIImage] = [ImageLiterals.BenefitView.bnfFirst, ImageLiterals.BenefitView.bnfSecond, ImageLiterals.BenefitView.bnfThird, ImageLiterals.BenefitView.bnfFourth]
    
    
    private let benefitCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setCollectionViewLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .bg_gray
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setCollectionView()
        setStyle()
        
    }

    private func setLayout() {
        self.view.addSubviews(benefitCollectionView)
        
        benefitCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
        
    }
    
    private func setStyle() {
        self.view.backgroundColor = .bg_gray
    }

    
    private func setCollectionView() {
        benefitCollectionView.dataSource = self
        benefitCollectionView.delegate = self
        
        benefitCollectionView.register(BenefitCollectionViewPointCheckCell.self, forCellWithReuseIdentifier: BenefitCollectionViewPointCheckCell.identifier)
        benefitCollectionView.register(BenefitCollectionPointCheckHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BenefitCollectionPointCheckHeaderView.identifier)
        benefitCollectionView.register(BenefitCollectionViewFamousBenefitCell.self, forCellWithReuseIdentifier: BenefitCollectionViewFamousBenefitCell.identifier)
        
    }
    
    static func setCollectionViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            case 0:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(105), heightDimension: .estimated(108)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: -10)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.5), heightDimension: .absolute(123)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)

                section.orthogonalScrollingBehavior = .continuous
                
                //섹션헤더 설정
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(53))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.boundarySupplementaryItems = [header]
                
                //백그라운드뷰 지정
                let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: BenefitCollectionViewSectionBackgroundView.identifier)
                section.decorationItems = [sectionBackgroundDecoration]
                
                return section
                
            case 1:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(343), heightDimension: .estimated(56)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .absolute(343), heightDimension: .absolute(338)), subitems: [item])
                group.interItemSpacing = NSCollectionLayoutSpacing.fixed(20)
                let section = NSCollectionLayoutSection(group: group)

                section.orthogonalScrollingBehavior = .continuous
                
                //섹션헤더 설정
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(53))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.boundarySupplementaryItems = [header]
                
                //백그라운드뷰 지정
                let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: BenefitCollectionViewSectionBackgroundView.identifier)
                section.decorationItems = [sectionBackgroundDecoration]
                
                return section
                
            default:
                return nil
            }
        }
        
        layout.register(BenefitCollectionViewSectionBackgroundView.self, forDecorationViewOfKind: BenefitCollectionViewSectionBackgroundView.identifier)
        
        return layout
    }
}

extension BenefitViewController: UICollectionViewDelegate { }
extension BenefitViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            4
        case 1:
            3
        default:
            0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenefitCollectionViewPointCheckCell.identifier, for: indexPath) as? BenefitCollectionViewPointCheckCell else { return UICollectionViewCell()}
            cell.backgroundImageView.image = pointCellBackgroundViewList[indexPath.item]
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenefitCollectionViewFamousBenefitCell.identifier, for: indexPath) as? BenefitCollectionViewFamousBenefitCell else { return UICollectionViewCell() }
            cell.userBenefitData = self.userBenefitData.brandList[indexPath.item]
            return cell
            
        default:
            return UICollectionViewCell()
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
            case 0:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BenefitCollectionPointCheckHeaderView.identifier, for: indexPath) as? BenefitCollectionPointCheckHeaderView else { return UICollectionReusableView()}
                header.layer.cornerRadius = 14
                header.backgroundColor = .bg_white
                return header
            
            default:
                return UICollectionReusableView()
            }
        default:
            return UICollectionReusableView()
        }
    }
}
