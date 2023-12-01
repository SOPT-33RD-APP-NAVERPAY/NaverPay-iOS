//
//  BenefitLikeDTO.swift
//  NaverPay
//
//  Created by 곽성준 on 12/1/23.
//

import Foundation

// MARK: - BenefitLikeDTO
//struct BenefitLikeDTO: Codable {
//    let status: Int
//    let message: String
//    let data: DataClass
//}

// MARK: - DataClass
struct BenefitLikeDTO: Codable {
    let brandID: Int
    let isBrandLike: Bool

    enum CodingKeys: String, CodingKey {
        case brandID = "brand_id"
        case isBrandLike = "is_brand_like"
    }
}

extension BenefitLikeDTO {
    static var emptaData = BenefitLikeDTO(brandID: 0, isBrandLike: false)
}
