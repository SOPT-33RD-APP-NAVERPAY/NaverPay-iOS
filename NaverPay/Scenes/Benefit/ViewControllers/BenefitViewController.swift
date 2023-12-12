//
//  BenefitViewController.swift
//  NaverPay
//
//  Created by 곽성준 on 11/21/23.
//

import UIKit
import SnapKit

final class BenefitViewController: UIViewController {
    
    private var userBenefitData: UserBenefitDataAppData? {
        didSet {
            benefitCollectionView.reloadData()
        }
    }
    
    private var benefitEntireData: BenefitEntireAppData? {
        didSet {
            benefitCollectionView.reloadData()
        }
    }
    
    private var BenefitSection: [BenefitSectionLayout] = [BenefitSectionLayout(delegate: PointCheckSectionType()),
                                                                          BenefitSectionLayout(delegate:
                                                                                                FamousBenefitSectionType()),
                                                                          BenefitSectionLayout(delegate:
                                                                                                PointCategorySectionType()),
                                                                          BenefitSectionLayout(delegate:
                                                                                                EntireBenefitSectionType()),
                                                                          BenefitSectionLayout(delegate:
                                                                                                AdBannerSectionType())]
    
    private let categoryData = CategoryData.dummy()
    
    private let benefitHeaderview = BenefitHeaderView()
    
    private let pointCellBackgroundViewList: [UIImage] = [ImageLiterals.BenefitView.bnfFirst, ImageLiterals.BenefitView.bnfSecond, ImageLiterals.BenefitView.bnfThird, ImageLiterals.BenefitView.bnfFourth]
    
    
    private lazy var benefitCollectionView: UICollectionView = {
        let layout = setCollectionViewLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
        
        getBenefitMainData()
        getBenefitEntireData()
        
        
    }
    
    private func setLayout() {
        self.view.addSubviews(benefitCollectionView,benefitHeaderview)
        
        benefitHeaderview.snp.makeConstraints {
            $0.top.trailing.leading.equalToSuperview()
            $0.height.equalTo(96)
        }
        
        benefitCollectionView.snp.makeConstraints {
            $0.top.equalTo(benefitHeaderview.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
    }
    
    private func setStyle() {
        self.view.backgroundColor = .bg_gray
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    private func setCollectionView() {
        benefitCollectionView.dataSource = self
        benefitCollectionView.delegate = self
        
        
        benefitCollectionView.register(BenefitCollectionViewPointCheckCell.self, forCellWithReuseIdentifier: BenefitCollectionViewPointCheckCell.identifier)
        benefitCollectionView.register(BenefitCollectionPointCheckHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BenefitCollectionPointCheckHeaderView.identifier)
        
        benefitCollectionView.register(BenefitCollectionViewFamousBenefitCell.self, forCellWithReuseIdentifier: BenefitCollectionViewFamousBenefitCell.identifier)
        benefitCollectionView.register(BenefitCollectionFamousBenefitSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BenefitCollectionFamousBenefitSectionHeaderView.identifier)
        benefitCollectionView.register(BenefitCollectionFamousBenefitSectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BenefitCollectionFamousBenefitSectionFooterView.identifier)
        
        benefitCollectionView.register(BenefitCollectionViewPointCategoryCell.self, forCellWithReuseIdentifier: BenefitCollectionViewPointCategoryCell.identifier)
        benefitCollectionView.register(BenefitCollectionCategorySectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BenefitCollectionCategorySectionHeaderView.identifier)
        
        benefitCollectionView.register(BenefitCollectionViewEntireBenefitCell.self, forCellWithReuseIdentifier: BenefitCollectionViewEntireBenefitCell.identifier)
        benefitCollectionView.register(BenefitCollectionEntireBenefitSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BenefitCollectionEntireBenefitSectionHeaderView.identifier)
        
        benefitCollectionView.register(BenefitCollectionViewAdBannerCell.self, forCellWithReuseIdentifier: BenefitCollectionViewAdBannerCell.identifier)
        benefitCollectionView.register(BenefitCollectionadBannerFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BenefitCollectionadBannerFooterView.identifier)
        
        
    }
    
    func setCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionNumber, env -> NSCollectionLayoutSection? in
            self.BenefitSection[sectionNumber].fetchLayoutSection()
        }
        
        layout.register(BenefitCollectionViewPointCheckSectionBackgroundView.self, forDecorationViewOfKind: BenefitCollectionViewPointCheckSectionBackgroundView.identifier)
        
        layout.register(BenefitCollectionViewFamousBenefitSectionBackgroundView.self, forDecorationViewOfKind: BenefitCollectionViewFamousBenefitSectionBackgroundView.identifier)
        
        return layout
        
//        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
//            
//            switch sectionNumber {
//            case 0:
//                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(105), heightDimension: .estimated(108)))
//                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: -10)
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.3), heightDimension: .absolute(123)), subitems: [item])
//                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .continuous
//                
//                //섹션헤더 설정 //백그라운드 회색 20 더함 50 + 20
//                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(73))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(
//                    layoutSize: headerSize,
//                    elementKind: UICollectionView.elementKindSectionHeader,
//                    alignment: .top
//                )
//                section.boundarySupplementaryItems = [header]
//                
//                //백그라운드뷰 지정
//                let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: BenefitCollectionViewPointCheckSectionBackgroundView.identifier)
//                section.decorationItems = [sectionBackgroundDecoration]
//                
//                return section
//                
//            case 1:
//                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(343), heightDimension: .absolute(80)))
//                
//                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .absolute(343), heightDimension: .absolute(269)), subitems: [item])
//                let section = NSCollectionLayoutSection(group: group)
//                
//                //섹션헤더 설정
//                let headerSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width - 40), heightDimension: .absolute(102))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(
//                    layoutSize: headerSize,
//                    elementKind: UICollectionView.elementKindSectionHeader,
//                    alignment: .top
//                )
//                
//                //섹션푸터 설정
//                let footerSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width - 32), heightDimension: .absolute(69))
//                let footer = NSCollectionLayoutBoundarySupplementaryItem(
//                    layoutSize: footerSize,
//                    elementKind: UICollectionView.elementKindSectionFooter,
//                    alignment: .bottom
//                )
//                section.boundarySupplementaryItems = [footer, header]
//                
//                
//                //백그라운드뷰 지정
//                let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: BenefitCollectionViewFamousBenefitSectionBackgroundView.identifier)
//                section.decorationItems = [sectionBackgroundDecoration]
//                
//                return section
//                
//            case 2:
//                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(64), heightDimension: .absolute(77)))
//                
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(77)), subitems: [item])
//                group.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)
//                let section = NSCollectionLayoutSection(group: group)
//                
//                //섹션헤더 설정
//                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(73))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(
//                    layoutSize: headerSize,
//                    elementKind: UICollectionView.elementKindSectionHeader,
//                    alignment: .top
//                )
//                section.boundarySupplementaryItems = [header]
//                
//                return section
//                
//            case 3:
//                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(343), heightDimension: .estimated(103)))
//                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .absolute(343), heightDimension: .absolute(421)), subitems: [item])
//                let section = NSCollectionLayoutSection(group: group)
//                
//                //섹션헤더 설정
//                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(63))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(
//                    layoutSize: headerSize,
//                    elementKind: UICollectionView.elementKindSectionHeader,
//                    alignment: .top
//                )
//                
//                section.boundarySupplementaryItems = [header]
//                
//                //백그라운드뷰 지정
//                let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: BenefitCollectionViewPointCheckSectionBackgroundView.identifier)
//                section.decorationItems = [sectionBackgroundDecoration]
//                
//                return section
//                
//            case 4:
//                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(343), heightDimension: .estimated(100)))
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)), subitems: [item])
//                let section = NSCollectionLayoutSection(group: group)
//                
//                section.orthogonalScrollingBehavior = .paging
//                
//                //섹션푸터 설정
//                let footerSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(103))
//                let footer = NSCollectionLayoutBoundarySupplementaryItem(
//                    layoutSize: footerSize,
//                    elementKind: UICollectionView.elementKindSectionFooter,
//                    alignment: .bottom
//                )
//                footer.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
//                
//                section.boundarySupplementaryItems = [footer]
//                return section
//                
//            default:
//                return nil
//            }
//        }
        
       
    }
}

extension BenefitViewController: UICollectionViewDelegate { }
extension BenefitViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let userBenefitData else { return 0}
        switch section {
        case 0:
            return pointCellBackgroundViewList.count
        case 1:
            return userBenefitData.brandList.count
        case 2:
            return categoryData.count
        case 3:
            return userBenefitData.brandList.count
        case 4:
            return 3
        default:
            return 0
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
            
            cell.likeTapCompletion = { [weak self] state in
                guard let self else { return }
                userBenefitData?.brandList[indexPath.row].isBrandLike = state
            }
            
            guard let userBenefitData else { return UICollectionViewCell() }
            
            cell.userBenefitData = userBenefitData.brandList[indexPath.item]
            cell.brandIDLabel.text = "\(indexPath.item + 1)"
            if indexPath.item == 0 {
                cell.brandIDLabel.textColor = .main_green
            } else {
                cell.brandIDLabel.textColor = .bg_black
            }
            cell.delegate = self
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenefitCollectionViewPointCategoryCell.identifier, for: indexPath) as? BenefitCollectionViewPointCategoryCell else { return UICollectionViewCell() }
            cell.categoryData = categoryData[indexPath.item]
            
            if indexPath.item == 0 {
                cell.backgroundColor = .bg_white
                cell.layer.cornerRadius = 14
                cell.layer.borderWidth = 1
                cell.layer.borderColor = UIColor.main_green.cgColor
                cell.categoryImageView.image?.withTintColor(.main_green, renderingMode: .alwaysTemplate)
                return cell
            }
            cell.backgroundColor = .bg_white
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.grayscale_gray3.cgColor
            
            cell.layer.cornerRadius = 14
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenefitCollectionViewEntireBenefitCell.identifier, for: indexPath) as? BenefitCollectionViewEntireBenefitCell else { return UICollectionViewCell() }
            
            cell.userBenefitData = benefitEntireData?.brandList[indexPath.item]
            
            if indexPath.item == 0 {
                cell.divideView.isHidden = true
            }
            return cell
            
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenefitCollectionViewAdBannerCell.identifier, for: indexPath) as? BenefitCollectionViewAdBannerCell else { return UICollectionViewCell() }
            cell.bannerImageView.image = cell.bannerImage[indexPath.item]
            
            return cell
            
        default:
            return UICollectionViewCell()
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
            case 0:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BenefitCollectionPointCheckHeaderView.identifier, for: indexPath) as? BenefitCollectionPointCheckHeaderView else { return UICollectionReusableView()}
                header.userData = userBenefitData
                header.delegate = self
                return header
                
            case 1:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BenefitCollectionFamousBenefitSectionHeaderView.identifier, for: indexPath) as? BenefitCollectionFamousBenefitSectionHeaderView else { return UICollectionReusableView()}
                header.backgroundColor = .bg_gray
                return header
                
            case 2:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BenefitCollectionCategorySectionHeaderView.identifier, for: indexPath) as? BenefitCollectionCategorySectionHeaderView else { return UICollectionReusableView()}
                header.backgroundColor = .bg_gray
                return header
                
            case 3:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BenefitCollectionEntireBenefitSectionHeaderView.identifier, for: indexPath) as? BenefitCollectionEntireBenefitSectionHeaderView else { return UICollectionReusableView()}
                return header
                
            default:
                return UICollectionReusableView()
            }
        case UICollectionView.elementKindSectionFooter:
            switch indexPath.section {
            case 1:
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BenefitCollectionFamousBenefitSectionFooterView.identifier, for: indexPath) as? BenefitCollectionFamousBenefitSectionFooterView else { return UICollectionReusableView() }
                footer.layer.cornerRadius = 14
                footer.backgroundColor = .bg_white
                return footer
                
            case 4:
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BenefitCollectionadBannerFooterView.identifier, for: indexPath) as? BenefitCollectionadBannerFooterView else { return UICollectionReusableView() }
                return footer
                
            default:
                return UICollectionReusableView()
            }
        default:
            return UICollectionReusableView()
        }
        
    }
}

extension BenefitViewController: ItemSelectedProtocol {
    func getButtonState(isLiked: Bool, brandId: Int) {
        if isLiked {
            postLikedBrand(brandIdNum: brandId, post: .post)
            NPToast.show(message: "'나의 혜택'에 보관했어요")
        } else {
            postLikedBrand(brandIdNum: brandId, post: .delete)
            NPToast.show(message: "보관을 취소했어요")
            
        }
    }
}


extension BenefitViewController {
    func handlingError(_ error: NetworkError) {
        switch error {
        case .clientError(let message):
            NPToast.show(message: "\(message)")
        default:
            NPToast.show(message: error.description)
            
        }
    }
    
}

extension BenefitViewController {
    func getBenefitMainData() {
        Task {
            do {
                let benefitMainData = try await BenefitService.shared.getBenefitMainData()
                userBenefitData = benefitMainData
            }
            catch {
                guard let error = error as? NetworkError else { return }
                handlingError(error)

            }
        }
    }
    func getBenefitEntireData() {
        Task {
            do {
                let data = try await BenefitService.shared.getBenefitEntireData()
                benefitEntireData = data
            }
            catch {
                guard let error = error as? NetworkError else { return }
                handlingError(error)
            }
        }
    }
    
    func postLikedBrand(brandIdNum: Int, post: HttpMethod) {
        Task {
            do {
                try await BenefitService.shared.sendBenefitLiked(brandId: brandIdNum, post: post)
                print(brandIdNum)
            }
            catch {
                guard let error = error as? NetworkError else { return }
                handlingError(error)

            }
        }
    }
}

extension BenefitViewController: NextButtonTapProtocol {
    func nextVC() {
        let nextVC = PointViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}

