//
//  HomeEventData.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/24.
//

//
//  HomeEventData.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/24.
//

import UIKit

struct HomeEventData {
    let logoImage: UIImage
    let description: String
    let detailDescription: String
    let color: UIColor
}

extension HomeEventData {
    static func dummy() -> [HomeEventData] {
        [
            HomeEventData(logoImage: ImageLiterals.MainView.event_img_logo_touslesjours, description: "매일매일 더블혜택", detailDescription: "최대 10%", color: .tous_les_bg),
            HomeEventData(logoImage: ImageLiterals.MainView.event_img_logo_cu, description: "매일매일 더블혜택", detailDescription: "최대 10%", color: .cu_bg),
            HomeEventData(logoImage: ImageLiterals.MainView.event_img_logo_pb, description: "매일매일 더블혜택", detailDescription: "최대 10%", color: .pb_bg)
        ]
    }
}
