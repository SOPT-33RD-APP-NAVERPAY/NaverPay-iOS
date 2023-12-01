import UIKit

struct HomeDataAppData: Codable {
    let userPoint: Int
    let onsitePayment: HomeOnsitePaymentData
    let brandList: [HomeBrandAppData]
    
    enum CodingKeys: String, CodingKey {
        case userPoint = "user_point"
        case onsitePayment = "onsite_payment"
        case brandList = "brand_list"
    }
}

struct HomeOnsitePaymentData: Codable {
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

struct HomeBrandAppData: Codable {
    let id: Int
    let name, place, logoImgURL, discountContent: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, place
        case logoImgURL = "logo_img_url"
        case discountContent = "discount_content"
    }
}

extension HomeDataAppData {
    static var emptyData = HomeDataAppData(userPoint: 0, onsitePayment: HomeOnsitePaymentData(id: 0, name: "", place: "", logoImgURL: "", amount: 0, paymentDate: ""), brandList: [])
}
