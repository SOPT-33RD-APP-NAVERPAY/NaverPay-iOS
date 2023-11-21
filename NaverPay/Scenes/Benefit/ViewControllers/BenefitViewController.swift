//
//  BenefitViewController.swift
//  NaverPay
//
//  Created by 곽성준 on 11/21/23.
//

import UIKit
import SnapKit

final class BenefitViewController: UIViewController {
    
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
                header.pinToVisibleBounds = true
                section.boundarySupplementaryItems = [header]
                
                //백그라운드뷰 지정
                let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: BenefitCollectionPointCheckBackgroundView.identifier)
                section.decorationItems = [sectionBackgroundDecoration]
                
                return section
                
            default:
                return nil
            }
        }
        
        layout.register(BenefitCollectionPointCheckBackgroundView.self, forDecorationViewOfKind: BenefitCollectionPointCheckBackgroundView.identifier)
        
        return layout
    }
}

extension BenefitViewController: UICollectionViewDelegate { }
extension BenefitViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenefitCollectionViewPointCheckCell.identifier, for: indexPath) as? BenefitCollectionViewPointCheckCell else { return UICollectionViewCell()}
            cell.backgroundColor = .white
            cell.backgroundImageView.image = pointCellBackgroundViewList[indexPath.item]
            return cell
            
        default:
            return UICollectionViewCell()
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
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
