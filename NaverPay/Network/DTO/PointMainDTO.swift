//
//  PointDTO.swift
//  NaverPay
//
//  Created by 이자민 on 11/30/23.
//

import Foundation


// MARK: - DataClass
struct PointMainDTO: Codable {
    let paymentMethodPoint, basicPoint, membershipPoint, reviewPoint: Int
    let userPoint: Int
    let brandList: [PointBrandList]
    
    enum CodingKeys: String, CodingKey {
        case userPoint = "user_point"
        case basicPoint = "basic_point"
        case membershipPoint = "membership_point"
        case reviewPoint = "review_point"
        case paymentMethodPoint = "payment_method_point"
        case brandList = "brand_list"
    }
    
}
// MARK: - BrandList
struct PointBrandList: Codable {
    let id: Int
    let name: String
    let saving: Int
    let paymentDate: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, saving
        case paymentDate = "payment_date"
    }
}



extension PointMainDTO {
    func toAppData() -> UserPointAppData {
        let data = self.brandList.map { data in
            PointBrandListAppData(id: data.id, name: data.name, saving: data.saving, paymentDate: data.paymentDate)
        }
        
        return UserPointAppData(paymentMethodPoint: self.paymentMethodPoint, basicPoint: self.basicPoint, membershipPoint: self.membershipPoint, reviewPoint: self.reviewPoint, userPoint: self.userPoint, brandList: data)
    }
    
    
}



extension PointMainDTO {
    private func formatPercentage(_ number: Int) -> Int {
        let totalPoints = paymentMethodPoint + basicPoint + membershipPoint + reviewPoint
        guard totalPoints > 0 else {
            return 0
        }
        
        let percentage = Int(Double(number) / Double(totalPoints) * 100)
        return percentage
    }
    
    private func formatNumber(_ number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }
    
    private func formateDate(_ string: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let date = formatter.date(from: string) {
            formatter.dateFormat = "MM.dd"
            return formatter.string(from: date)
        }
        else {
            return "Invalid Date"
        }
        
    }
    
    private func formateTime(_ string: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let time = formatter.date(from: string) {
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: time)
        }
        else {
            return "Invalid Time"
        }
        
    }
}
