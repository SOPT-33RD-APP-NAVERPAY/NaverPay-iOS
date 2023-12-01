//
//  HomeDTO.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/29.
//

import UIKit


struct HomeDTO: Codable {
    let userPoint: Int
    let onsitePayment: OnsitePayment
    let brandList: [HomeBrandList]
    
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
        case amount
        case paymentDate = "payment_date"
    }
}

struct HomeBrandList: Codable {
    let id: Int
    let name, place, logoImgURL, discountContent: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, place
        case logoImgURL = "logo_img_url"
        case discountContent = "discount_content"
    }
}

extension HomeDTO {
    func toAppData() -> HomeDataAppData {
        let homeData = self.brandList.map { brandData in
            HomeBrandAppData(id: brandData.id, name: brandData.name, place: brandData.place, logoImgURL: brandData.logoImgURL, discountContent: brandData.discountContent)
        }
        
        let homeOnsitePaymentData = HomeOnsitePaymentData(
            id: self.onsitePayment.id,
            name: self.onsitePayment.name,
            place: self.onsitePayment.place,
            logoImgURL: self.onsitePayment.logoImgURL,
            amount: self.onsitePayment.amount,
            paymentDate: self.onsitePayment.paymentDate
        )
        return HomeDataAppData(userPoint: self.userPoint, onsitePayment: homeOnsitePaymentData, brandList: homeData)
    }
}

