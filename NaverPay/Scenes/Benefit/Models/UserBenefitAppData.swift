//
//  UserBenefitAppData.swift
//  NaverPay
//
//  Created by 곽성준 on 11/23/23.
//

import UIKit

// MARK: - DataClass
struct UserBenefitDataAppData {
    let userName: String
    let userPoint: Int
    let brandList: [BrandListAppData]

    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case userPoint = "user_point"
        case brandList = "brand_list"
    }
}

// MARK: - BrandList
struct BrandListAppData {
    let id: Int
    let logoImgURL: UIImage
    let name, discountContent, discountType: String
    let isBrandLike: Bool

    enum CodingKeys: String, CodingKey {
        case id, name
        case logoImgURL = "logo_img_url"
        case discountContent = "discount_content"
        case discountType = "discount_type"
        case isBrandLike = "is_brand_like"
    }
}

extension UserBenefitDataAppData {
    static func dummy() -> UserBenefitDataAppData {
        
            UserBenefitDataAppData(userName: "곽성준", userPoint: 11500, brandList: [
                BrandListAppData(id: 1, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "네플멤 회원은 CU 최대", discountType: "10%", isBrandLike: true),
                BrandListAppData(id: 2, logoImgURL: ImageLiterals.BenefitView.typeAd2, name: "파리바게뜨", discountContent: "네이버페이 회원은 매일", discountType: "더블혜택", isBrandLike: true),
                BrandListAppData(id: 3, logoImgURL: ImageLiterals.BenefitView.typeAd3, name: "신라호텔", discountContent: "30만원 이상 결제 시", discountType: "더블혜택", isBrandLike: false)])
            
//            UserBenefitDataAppData(userName: "김선우", userPoint: 20000, brandList: [
//                BrandListAppData(id: 1, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "10%", discountType: "네플멤 회원은 CU 최대", isBrandLike: true),
//                BrandListAppData(id: 2, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "10%", discountType: "네플멤 회원은 CU 최대", isBrandLike: true),
//                BrandListAppData(id: 3, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "10%", discountType: "네플멤 회원은 CU 최대", isBrandLike: true)]),
//            
//            UserBenefitDataAppData(userName: "곽성준", userPoint: 11500, brandList: [
//                BrandListAppData(id: 1, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "10%", discountType: "네플멤 회원은 CU 최대", isBrandLike: true),
//                BrandListAppData(id: 2, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "10%", discountType: "네플멤 회원은 CU 최대", isBrandLike: true),
//                BrandListAppData(id: 3, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "10%", discountType: "네플멤 회원은 CU 최대", isBrandLike: true)])
        
    }
}

