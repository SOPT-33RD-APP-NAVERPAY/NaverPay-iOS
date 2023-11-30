//
//  PlaceMainDTO.swift
//  NaverPay
//
//  Created by 이자민 on 11/30/23.
//

import Foundation


struct PlaceMainDTO: Codable {
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
struct PlaceBrandList: Codable {
    let id: Int
    let logoImgURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoImgURL = "logo_img_url"
    }
}

// MARK: - List
struct PlaceList: Codable {
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


extension PlaceMainDTO {
    func toAppData() -> UserPlaceAppData {
        let nearbyPlaceData = self.nearbyplaceList.map { placeData in
                    PlaceList(id: placeData.id, logoImgURL: placeData.logoImgURL, name: placeData.name, distance: placeData.distance)
                }

                let brandListData = self.brandList.map { brandData in
                    PlaceBrandList(id: brandData.id, logoImgURL: brandData.logoImgURL)
                }

                let onsitePaymentData = self.onsitepaymentList.map { placeData in
                    PlaceList(id: placeData.id, logoImgURL: placeData.logoImgURL, name: placeData.name, distance: placeData.distance)
                }

        return UserPlaceAppData(userName: self.userName, nearbyplaceList: nearbyPlaceData, brandList: brandListData, onsitepaymentList: onsitePaymentData)
    }

}
