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
    }

    private func setLayout() {
        view.addSubviews(benefitCollectionView)
        
        benefitCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.leading.bottom.equalToSuperview()
        }
        
    }
    
    private func setCollectionView() {
        benefitCollectionView.dataSource = self
        benefitCollectionView.delegate = self
        
        benefitCollectionView.register(BenefitCollectionViewPointCheckCell.self, forCellWithReuseIdentifier: BenefitCollectionViewPointCheckCell.identifier)
        
    }
    
    static func setCollectionViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            case 0:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(105), heightDimension: .estimated(108)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.5), heightDimension: .estimated(2)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                //백그라운드뷰 지정
                let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: BenefitCollectionPointCheckBackgroundView.identifier)
                sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
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
    
    
}
