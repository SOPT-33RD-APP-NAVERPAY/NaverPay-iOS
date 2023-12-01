//
//  BenefitEntireSectionDTO.swift
//  NaverPay
//
//  Created by 곽성준 on 11/30/23.
//

import Foundation

//// MARK: - BenefitEntireSectionDTO
//struct BenefitEntireSectionDTO: Codable {
//    let status: Int
//    let message: String
//    let data: DataClass
//}

// MARK: - DataClass
struct BenefitEntireDTO: Codable {
    let brandList: [BrandEntireList]

    enum CodingKeys: String, CodingKey {
        case brandList = "brand_list"
    }
}

// MARK: - BrandList
struct BrandEntireList: Codable {
    let id: Int
    let name: String
    let logoImgURL: String
    let discountContent, discountType: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case logoImgURL = "logo_img_url"
        case discountContent = "discount_content"
        case discountType = "discount_type"
    }
}

extension BenefitEntireDTO {
    func toAppData() -> BenefitEntireAppData {
        let data = self.brandList.map { brandData in
            BrandEntireAppData(id: brandData.id, name: brandData.name, logoImgURL: brandData.logoImgURL, discountContent: brandData.discountContent, discountType: brandData.discountType)
        }
        
        return BenefitEntireAppData(brandList: data)
    }
}
