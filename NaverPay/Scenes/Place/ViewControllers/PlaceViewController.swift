//
//  PlaceViewController.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/20.
//

import UIKit
import SnapKit

final class PlaceViewController: UIViewController {
    static let identifier: String = "PlaceViewController"
    private var userName: String = "남희주"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .bg_white
        setLayout()
        setCollectionViewConfig()
        setCollectionViewLayout()
        
    }
    
    private let placeCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero
                                              , collectionViewLayout: UICollectionViewFlowLayout())
        
        return collectionView
        
    }()
    
    
    
    private func setLayout(){
        self.view.addSubview(placeCollectionView)
        
        placeCollectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func setCollectionViewLayout(){
        let flowLayout = UICollectionViewFlowLayout()
        self.placeCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setCollectionViewConfig() {
        self.placeCollectionView.register(NearPlaceCollectionViewCell.self, forCellWithReuseIdentifier: NearPlaceCollectionViewCell.identifier)
        self.placeCollectionView.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
        self.placeCollectionView.register(BrandCollectionViewCell.self, forCellWithReuseIdentifier: BrandCollectionViewCell.identifier)
        self.placeCollectionView.register(TapPlaceCollectionViewCell.self, forCellWithReuseIdentifier: TapPlaceCollectionViewCell.identifier)
        self.placeCollectionView.register(TitleCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleCollectionReusableView.identifier)
        self.placeCollectionView.register(TapPlaceCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TapPlaceCollectionReusableView.identifier)
        self.placeCollectionView.delegate = self
        self.placeCollectionView.dataSource = self
    }
}


extension PlaceViewController: UICollectionViewDelegate {
    
}

extension PlaceViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4 // 섹션 개수
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
            case 0:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TapPlaceCollectionReusableView.identifier, for: indexPath) as? TapPlaceCollectionReusableView
                else {
                    return TapPlaceCollectionReusableView()
                }
                return header
            case 1:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleCollectionReusableView.identifier, for: indexPath) as? TitleCollectionReusableView
                else {
                    return TitleCollectionReusableView()
                }
                header.headerLabel.text = "\(userName)님과 가까운 장소"
                header.headerButton.setImage(ImageLiterals.PlaceView.placeButtonmapIcon, for: .normal)
                header.headerButton.backgroundColor = .main_green
                header.headerButton.setTitle("지도로 보기", for: .normal)
                return header
                
            case 2:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleCollectionReusableView.identifier, for: indexPath) as? TitleCollectionReusableView
                else {
                    return UICollectionReusableView()
                }
                header.headerLabel.text = "패션에 관심있는\n\(userName)님을 위한 추천"
                header.headerButton.backgroundColor = .bg_black
                header.headerButton.setTitle("추천 더보기 >", for: .normal)
                return header
                
            case 3:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleCollectionReusableView.identifier, for: indexPath) as? TitleCollectionReusableView
                else {
                    return UICollectionReusableView()
                }
                header.headerLabel.text = "전국 12만개 가맹점에서\n현장결제 하세요"
                header.headerButton.backgroundColor = .main_green
                header.headerButton.setTitle("전체 보기 >", for: .normal)
                return header
                
            default:
                return UICollectionReusableView()
            }
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            switch section {
            case 0:
                return CGSize(width: collectionView.bounds.width - 40, height: 30)
            case 1:
                return CGSize(width: collectionView.bounds.width - 40, height: 33)
            case 2:
                return CGSize(width: collectionView.bounds.width - 40, height: 52)
            case 3:
                return CGSize(width: collectionView.bounds.width - 40, height: 52)
            default:
                return CGSize(width: collectionView.bounds.width - 40, height: 52)
            }
        }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TapPlaceCollectionViewCell.identifier, for: indexPath) as? TapPlaceCollectionViewCell
            else { return UICollectionViewCell()}
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearPlaceCollectionViewCell.identifier, for: indexPath) as? NearPlaceCollectionViewCell
            else { return UICollectionViewCell()}
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath) as? BrandCollectionViewCell
            else{
                return UICollectionViewCell()
            }
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
}

extension PlaceViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section{
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 32)
        case 1:
            return CGSize(width: (UIScreen.main.bounds.width - 64) / 3, height: 132)
            
        case 2:
            return CGSize(width: (UIScreen.main.bounds.width - 64) / 3, height: (UIScreen.main.bounds.width - 64) / 3)
            
        case 3:
            return CGSize(width: (UIScreen.main.bounds.width - 64) / 3, height: 104)
            
        default:
            return CGSize(width: (UIScreen.main.bounds.width - 64) / 3, height: 132)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section{
        case 0:
            return UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        default:
            return UIEdgeInsets(top: 18, left: 20, bottom: 60, right: 20)
        }
    }
}

