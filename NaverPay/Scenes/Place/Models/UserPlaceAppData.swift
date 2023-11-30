//
//  UserPlaceAppData.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/25.
//


import UIKit

// MARK: - DataClass
struct UserPlaceAppData: Codable {
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

extension UserPlaceAppData {
    static var emptyData = UserPlaceAppData(userName: "", nearbyplaceList: [], brandList: [], onsitepaymentList: [])
}
// MARK: - BrandList
struct PlaceBrandListAppData: Codable {
    let id: Int
    let logoImgURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoImgURL = "logo_img_url"
    }
}

// MARK: - List
struct PlaceListAppData: Codable {
    let id: Int
    let logoImgURL: String
    let name: String
    let distance: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case logoImgURL = "logo_img_url"
        case name, distance
    }
}


extension UserPlaceAppData {
    static func dummy() -> UserPlaceAppData {
        UserPlaceAppData(userName: "합세조",
                           nearbyplaceList: [
                            PlaceList(id: 1, logoImgURL: "logoGs25", name: "Place1", distance: 25),
                            PlaceList(id: 2, logoImgURL: "logoGs25", name: "Place2", distance: 25),
                            PlaceList(id: 3, logoImgURL: "logoGs25", name: "Place3", distance: 25),
                            PlaceList(id: 4, logoImgURL: "logoGs25", name: "Place4", distance: 25),
                            PlaceList(id: 5, logoImgURL: "logoGs25", name: "Place5", distance: 25),
                            PlaceList(id: 6, logoImgURL: "logoGs25", name: "Place6", distance: 25)
                           ],
                           brandList: [
                            PlaceBrandList(id: 1, logoImgURL:  "logoGs25"),
                            PlaceBrandList(id: 2, logoImgURL: "logoGs25"),
                            PlaceBrandList(id: 3, logoImgURL: "logoGs25"),
                            PlaceBrandList(id: 4, logoImgURL: "logoGs25"),
                            PlaceBrandList(id: 5, logoImgURL: "logoGs25"),
                            PlaceBrandList(id: 6, logoImgURL: "logoGs25")
        ],
                           onsitepaymentList: [
                            PlaceList(id: 1, logoImgURL: "logoGs25", name: "Place1", distance: 30),
                            PlaceList(id: 2, logoImgURL: "logoGs25", name: "Place2", distance: 30),
                            PlaceList(id: 3, logoImgURL: "logoGs25", name: "Place3", distance: 30),
                            PlaceList(id: 4, logoImgURL: "logoGs25", name: "Place4", distance: 30),
                            PlaceList(id: 5, logoImgURL: "logoGs25", name: "Place5", distance: 30),
                            PlaceList(id: 6, logoImgURL: "logoGs25", name: "Place6", distance: 30)
                           ])
    }
}
