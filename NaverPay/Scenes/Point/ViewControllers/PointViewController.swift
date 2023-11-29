//
//  PointViewController.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/23.
//

import UIKit
import SnapKit

final class PointViewController: UIViewController {
    static let identifier: String = "PointViewController"
    
    private let userPointData = UserPointAppData.dummy()
    
    lazy var pointHeaderView = NaverNavigationBar(self, leftItem: .point)
    
    private let pointCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setCollectionViewConfig()
        setCollectionViewLayout()
        
    }

    private func setLayout(){
        self.view.addSubviews(pointCollectionView,pointHeaderView)
        pointCollectionView.backgroundColor = .bg_gray
        self.navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.backgroundColor = .bg_white
        
        
        pointHeaderView.snp.makeConstraints {
            $0.top.trailing.leading.equalToSuperview()
            $0.height.equalTo(96)
        }
        
        pointCollectionView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(pointHeaderView.snp.bottom)
        }
        
    }
    
    private func setCollectionViewLayout(){
        let flowLayout = UICollectionViewFlowLayout()
        self.pointCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setCollectionViewConfig() {
        self.pointCollectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        self.pointCollectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
        self.pointCollectionView.register(GraphCollectionViewCell.self, forCellWithReuseIdentifier: GraphCollectionViewCell.identifier)
        self.pointCollectionView.register(UsageCollectionViewCell.self, forCellWithReuseIdentifier: UsageCollectionViewCell.identifier)
        self.pointCollectionView.delegate = self
        self.pointCollectionView.dataSource = self
    }

}

extension PointViewController: UICollectionViewDelegate {
    
}

extension PointViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell
            else { return UICollectionViewCell()}
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as? BannerCollectionViewCell
            else { return UICollectionViewCell()}
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GraphCollectionViewCell.identifier, for: indexPath) as? GraphCollectionViewCell
            else { return UICollectionViewCell()}
            cell.userPointData = self.userPointData
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsageCollectionViewCell.identifier, for: indexPath) as? UsageCollectionViewCell
            else { return UICollectionViewCell()}
            cell.userPointData = self.userPointData.brandList[indexPath.item]
            return cell
            
        default:
            return UICollectionViewCell()
            
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 3:
            return userPointData.brandList.count
        default:
            return 1
        }
    }
    
}


extension PointViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 267)
            
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 73)
            
        case 2:
            return CGSize(width: UIScreen.main.bounds.width, height: 500)
            
        case 3:
            return CGSize(width: UIScreen.main.bounds.width, height: 77)
            
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 32)
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // 섹션 간 구분선의 색상을 설정하세요.
        switch section {
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 9)
        case 2:
            return CGSize(width: UIScreen.main.bounds.width, height: 9)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
