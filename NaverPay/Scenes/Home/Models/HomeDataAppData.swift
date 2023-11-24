//
//  HomeDataAppData.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/23.
//

import UIKit


struct HomeDataAppData: Codable {
    let userPoint: Int
    let onsitePayment: OnsitePayment
    let brandList: [BrandAppData]
    
    enum CodingKeys: String, CodingKey {
        case userPoint = "user_point"
        case onsitePayment = "onsite_payment"
        case brandList = "brand_list"
    }
}

struct OnsitePayment: Codable {
    let id: Int
    let name, place, logoImgURL: String
    let amount: Int
    let paymentDate: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, place
        case logoImgURL = "logo_img_url"
        case amount, paymentDate
    }
}

struct BrandAppData: Codable {
    let id: Int
    let name, place, logoImgURL, discountContent: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, place
        case logoImgURL = "logo_img_url"
        case discountContent = "discount_content"
    }
}

extension HomeDataAppData {
    static func dummy() -> HomeDataAppData {
        HomeDataAppData(
            userPoint: 11500,
            onsitePayment: OnsitePayment(
                id: 1,
                name: "GS25",
                place: "건대점",
                logoImgURL: "logoGs25",
                amount: 25000,
                paymentDate: "2023. 11. 16 오후 12:21:21"
            ),
            brandList: [
                BrandAppData(
                    id: 1,
                    name: "CU",
                    place: "건대점",
                    logoImgURL: "logoGs25",
                    discountContent: "네플멤 회원은 CU 최대"
                ),
                BrandAppData(
                    id: 2,
                    name: "파리바게뜨",
                    place: "건대점",
                    logoImgURL: "logoGs25",
                    discountContent: "현장결제 및 포인트 더블혜택"
                ),
                BrandAppData(
                    id: 3,
                    name: "신라호텔",
                    place: " ",
                    logoImgURL: "logoGs25",
                    discountContent: "30만원 이상 결제시 1만원"
                ),
                BrandAppData(
                    id: 4,
                    name: "도미노피자",
                    place: "건대점",
                    logoImgURL: "logoGs25",
                    discountContent: "QR결제시 최대 2천원 할인"
                )
            ]
        )
    }
}
