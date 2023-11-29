//
//  UserPointAppData.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/25.
//

// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome3 = try Welcome3(json)

import Foundation

// MARK: - DataClass
struct UserPointAppData {
    let paymentMethodPoint, basicPoint, membershipPoint, reviewPoint: Int
    let userPoint: Int
    let brandList: [PointBrandList]
    
    
    
    var formattedPaymentPoint: String {
        return formatNumber(paymentMethodPoint)
    }
    
    var formattedUserPoint: String {
        return formatNumber(userPoint)
    }
    
    var formattedBasicPoint: String {
        return formatNumber(basicPoint)
    }
    
    var formattedMembershipPoint: String {
        return formatNumber(membershipPoint)
    }
    
    var formattedReviewPoint: String {
        return formatNumber(reviewPoint)
    }
    
    var formattedPaymentPercentage: Int {
            return formatPercentage(paymentMethodPoint)
        }

        var formattedBasicPercentage: Int {
            return formatPercentage(basicPoint)
        }

        var formattedMembershipPercentage: Int {
            return formatPercentage(membershipPoint)
        }

        var formattedReviewPercentage: Int {
            return formatPercentage(reviewPoint)
        }

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
}

// MARK: - BrandList
struct PointBrandList {
    let id: Int
    let name: String
    let saving: Int
    let paymentDate: String
    
    var formattedSaving: String {
        return formatNumber(saving)
    }
    
    var formattedPaymentDate: String {
        return formateDate(paymentDate)
    }
    
    var formattedPaymentTime: String {
        return formateTime(paymentDate)
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
    
    
    private func formatNumber(_ number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }
}


extension UserPointAppData {
    static func dummy() -> UserPointAppData {
        
        UserPointAppData(paymentMethodPoint: 5000, basicPoint: 2000, membershipPoint: 3000, reviewPoint: 4000, userPoint: 20000, brandList: [
            PointBrandList(id: 1, name: "가게 이름1", saving: 1000, paymentDate: "2023-11-27T13:18:59"),
            PointBrandList(id: 2, name: "가게 이름2", saving: 2000, paymentDate: "2023-11-27T13:18:59"),
            PointBrandList(id: 3, name: "가게 이름3", saving: 3000, paymentDate: "2023-11-27T13:18:59"),
            PointBrandList(id: 4, name: "가게 이름4", saving: 4000, paymentDate: "2023-11-27T13:18:59"),
            
        ])
        
    }
}
