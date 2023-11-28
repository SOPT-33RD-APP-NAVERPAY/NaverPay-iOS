//
//  BenefitMainDTO.swift
//  NaverPay
//
//  Created by 곽성준 on 11/29/23.
//

import Foundation

// MARK: - BenefitDTO
//struct BenefitMainDTO: Codable {
//    let status: Int
//    let message: String
//    let data: DataClass
//}

// MARK: - DataClass
struct BenefitMainDTO: Codable {
    let userName: String
    let userPoint: Int
    let brandList: [BrandList]

    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case userPoint = "user_point"
        case brandList = "brand_list"
    }
}

// MARK: - BrandList
struct BrandList: Codable {
    let id: Int
    let name: String
    let logoImgURL: String
    let discountContent, discountType: String
    let isBrandLike: Bool

    enum CodingKeys: String, CodingKey {
        case id, name
        case logoImgURL = "logo_img_url"
        case discountContent = "discount_content"
        case discountType = "discount_type"
        case isBrandLike = "is_brand_like"
    }
}

extension BenefitMainDTO {
    func toAppData() -> UserBenefitDataAppData {
        let data = self.brandList.map { brandData in
            BrandListAppData(id: brandData.id, logoImgURL: brandData.logoImgURL, name: brandData.name, discountContent: brandData.discountContent, discountType: brandData.discountType, isBrandLike: brandData.isBrandLike)
        }
        
        return UserBenefitDataAppData(userName: self.userName, userPoint: self.userPoint, brandList: data)
    }
}

