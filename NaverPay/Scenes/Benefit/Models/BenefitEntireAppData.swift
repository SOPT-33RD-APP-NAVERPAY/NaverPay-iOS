//
//  BenefitEntireAppData.swift
//  NaverPay
//
//  Created by 곽성준 on 11/30/23.
//

import Foundation

struct BenefitEntireAppData {
    let brandList: [BrandEntireAppData]

}

extension BenefitEntireAppData {
    static var emptyData = BenefitEntireAppData(brandList: [])
}

// MARK: - BrandList
struct BrandEntireAppData {
    let id: Int
    let name: String
    let logoImgURL: String
    let discountContent, discountType: String

}



