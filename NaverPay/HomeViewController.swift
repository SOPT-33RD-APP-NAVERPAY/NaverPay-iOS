//
//  MainViewController.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    private let HomeCollectionView: UICollectionView = {
          let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setCollectionViewLayout())
          collectionView.showsVerticalScrollIndicator = false
          collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .bg_black
          return collectionView
      }()



      override func viewDidLoad() {
          super.viewDidLoad()

          setLayout()
          setCollectionView()
      }



      private func setLayout() {
          view.addSubviews(HomeCollectionView)

          HomeCollectionView.snp.makeConstraints {
              $0.top.equalTo(view.safeAreaLayoutGuide)
              $0.trailing.leading.bottom.equalToSuperview()
          }

      }

      private func setCollectionView() {
          HomeCollectionView.dataSource = self
          HomeCollectionView.delegate = self
      }

      static func setCollectionViewLayout() -> UICollectionViewLayout {

          let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in

              switch sectionNumber {
              case 0:
                  let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(280)))
                  let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1.5)), subitems: [item])
                  let section = NSCollectionLayoutSection(group: group)
                  section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 44, trailing: 0)

                  return section

              default:
                  return nil
              }
          }
          return layout
      }
  }

  extension HomeViewController: UICollectionViewDelegate { }
  extension HomeViewController: UICollectionViewDataSource {

      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 1
      }

      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          return UICollectionViewCell()
      }

      func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 1
      }


}
