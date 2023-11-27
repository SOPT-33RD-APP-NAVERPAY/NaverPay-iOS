//
//  UserPlaceAppData.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/25.
//


import UIKit

// MARK: - DataClass
struct UserPlaceDataClass {
    let userName: String
    let nearbyplaceList: [PlaceList]
    let brandList: [PlaceBrandList]
    let onsitepaymentList: [PlaceList]

    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case nearbyplaceList = "nearbyplace_list"
        case brandList = "brand_list"
        case onsitepaymentList = "onsitepayment_list"
    }
}

// MARK: - BrandList
struct PlaceBrandList {
    let id: Int
    let logoImgURL: UIImage

    enum CodingKeys: String, CodingKey {
        case id
        case logoImgURL = "logo_img_url"
    }
}

enum LogoImgURL: String {
    case empty = "..."
}

// MARK: - List
struct PlaceList {
    let id: Int
    let logoImgURL: UIImage
    let name: String
    let distance: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case logoImgURL = "logo_img_url"
        case name, distance
    }
}


extension UserPlaceDataClass {
    static func dummy() -> UserPlaceDataClass {
        UserPlaceDataClass(userName: "합세조",
                           nearbyplaceList: [
                            PlaceList(id: 1, logoImgURL: ImageLiterals.PlaceView.placeCardCU, name: "Place1", distance: 25),
                            PlaceList(id: 2, logoImgURL: ImageLiterals.PlaceView.placeCardCU, name: "Place2", distance: 25),
                            PlaceList(id: 3, logoImgURL: ImageLiterals.PlaceView.placeCardCU, name: "Place3", distance: 25),
                            PlaceList(id: 4, logoImgURL: ImageLiterals.PlaceView.placeCardCU, name: "Place4", distance: 25),
                            PlaceList(id: 5, logoImgURL: ImageLiterals.PlaceView.placeCardCU, name: "Place5", distance: 25),
                            PlaceList(id: 6, logoImgURL: ImageLiterals.PlaceView.placeCardCU, name: "Place6", distance: 25)
                           ],
                           brandList: [
                            PlaceBrandList(id: 1, logoImgURL: ImageLiterals.PlaceView.placeCardRecommendDummy),
                            PlaceBrandList(id: 2, logoImgURL: ImageLiterals.PlaceView.placeCardRecommendDummy),
                            PlaceBrandList(id: 3, logoImgURL: ImageLiterals.PlaceView.placeCardRecommendDummy),
                            PlaceBrandList(id: 4, logoImgURL: ImageLiterals.PlaceView.placeCardRecommendDummy),
                            PlaceBrandList(id: 5, logoImgURL: ImageLiterals.PlaceView.placeCardRecommendDummy),
                            PlaceBrandList(id: 6, logoImgURL: ImageLiterals.PlaceView.placeCardRecommendDummy)
        ],
                           onsitepaymentList: [
                            PlaceList(id: 1, logoImgURL: ImageLiterals.PlaceView.placeCardDomino, name: "Place1", distance: 30),
                            PlaceList(id: 2, logoImgURL: ImageLiterals.PlaceView.placeCardDomino, name: "Place2", distance: 30),
                            PlaceList(id: 3, logoImgURL: ImageLiterals.PlaceView.placeCardDomino, name: "Place3", distance: 30),
                            PlaceList(id: 4, logoImgURL: ImageLiterals.PlaceView.placeCardDomino, name: "Place4", distance: 30),
                            PlaceList(id: 5, logoImgURL: ImageLiterals.PlaceView.placeCardDomino, name: "Place5", distance: 30),
                            PlaceList(id: 6, logoImgURL: ImageLiterals.PlaceView.placeCardDomino, name: "Place6", distance: 30)
                           ])
    }
}
