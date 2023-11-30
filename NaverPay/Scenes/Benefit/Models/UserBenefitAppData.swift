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
    var brandList: [BrandListAppData]

}

extension UserBenefitDataAppData {
    static var emptyData = UserBenefitDataAppData(userName: "", userPoint: 0, brandList: [])
}

// MARK: - BrandList
struct BrandListAppData {
    let id: Int
    let logoImgURL: String
    let name, discountContent, discountType: String
    var isBrandLike: Bool

}

//extension UserBenefitDataAppData {
//    static func dummy() -> UserBenefitDataAppData {
//        
//            UserBenefitDataAppData(userName: "곽성준", userPoint: 11500, brandList: [
//                BrandListAppData(id: 1, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "네플멤 회원은 CU 최대", discountType: "10%", isBrandLike: true),
//                BrandListAppData(id: 2, logoImgURL: ImageLiterals.BenefitView.typeAd2, name: "파리바게뜨", discountContent: "네이버페이 회원은 매일", discountType: "더블혜택", isBrandLike: true),
//                BrandListAppData(id: 3, logoImgURL: ImageLiterals.BenefitView.typeAd3, name: "신라호텔", discountContent: "30만원 이상 결제 시", discountType: "더블혜택", isBrandLike: false),
//                BrandListAppData(id: 3, logoImgURL: ImageLiterals.BenefitView.typeAd3, name: "신라호텔", discountContent: "30만원 이상 결제 시", discountType: "더블혜택", isBrandLike: false)])
//        
            
//            UserBenefitDataAppData(userName: "김선우", userPoint: 20000, brandList: [
//                BrandListAppData(id: 1, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "10%", discountType: "네플멤 회원은 CU 최대", isBrandLike: true),
//                BrandListAppData(id: 2, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "10%", discountType: "네플멤 회원은 CU 최대", isBrandLike: true),
//                BrandListAppData(id: 3, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "10%", discountType: "네플멤 회원은 CU 최대", isBrandLike: true)]),
//
//            UserBenefitDataAppData(userName: "곽성준", userPoint: 11500, brandList: [
//                BrandListAppData(id: 1, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "10%", discountType: "네플멤 회원은 CU 최대", isBrandLike: true),
//                BrandListAppData(id: 2, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "10%", discountType: "네플멤 회원은 CU 최대", isBrandLike: true),
//                BrandListAppData(id: 3, logoImgURL: ImageLiterals.BenefitView.typeAd1, name: "CU", discountContent: "10%", discountType: "네플멤 회원은 CU 최대", isBrandLike: true)])
        
  

