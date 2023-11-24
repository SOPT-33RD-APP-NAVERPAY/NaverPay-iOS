//
//  FormattedString.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/24.
//

import Foundation

extension Int {
    func formattedString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: self) ?? ""
    }
}
