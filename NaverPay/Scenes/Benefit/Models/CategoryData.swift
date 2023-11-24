//
//  CategoryData.swift
//  NaverPay
//
//  Created by 곽성준 on 11/23/23.
//

import UIKit

struct CategoryData {
    let categoryIcon: UIImage
    let categoryLabel: String
}

extension CategoryData {
    static func dummy() -> [CategoryData] {
        [
            CategoryData(categoryIcon: ImageLiterals.BenefitView.percentageCircle, categoryLabel: "즉시적립"),
            CategoryData(categoryIcon: ImageLiterals.BenefitView.bnfIcOffline, categoryLabel: "현장결제"),
            CategoryData(categoryIcon: ImageLiterals.BenefitView.bnfIcJoin, categoryLabel: "가입하면"),
            CategoryData(categoryIcon: ImageLiterals.BenefitView.bnfIcPurchase, categoryLabel: "구매하면"),
            CategoryData(categoryIcon: ImageLiterals.BenefitView.bnfIcFree, categoryLabel: "체험하면")
        ]
    }
}
