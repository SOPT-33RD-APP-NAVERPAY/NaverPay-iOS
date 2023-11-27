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
struct UserPointAppDataClass {
    let userPoint, basicPoint, membershipPoint, reviewPoint: Int
    let paymentMethodPoint: Int
    let brandList: [PointBrandList]
}

// MARK: - BrandList
struct PointBrandList {
    let id: Int
    let name: String
    let saving: Int
    let paymentDate: String
}


extension UserPointAppDataClass {
    static func dummy() -> UserPointAppDataClass {
        
        UserPointAppDataClass(userPoint: 1000, basicPoint: 2000, membershipPoint: 3000, reviewPoint: 4000, paymentMethodPoint: 5000, brandList: [
            PointBrandList(id: 1, name: "가게 이름1", saving: 1000, paymentDate: "11:15"),
            PointBrandList(id: 2, name: "가게 이름2", saving: 2000, paymentDate: "12:15"),
            PointBrandList(id: 3, name: "가게 이름3", saving: 3000, paymentDate: "13:15"),
            PointBrandList(id: 4, name: "가게 이름4", saving: 4000, paymentDate: "14:15")
        ])
        
    }
}
