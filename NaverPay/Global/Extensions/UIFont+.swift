//
//  UIFont+.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/20.
//
import UIKit
enum FontName: String {
    case head_bold_20
    case subtitle_smbold_18, subtitle_bold_17
    case number_bold_27
    case body_bold_16, body_smbold_16, body_bold_15, body_medium_15, body_regular_15
    case detail_bold_14, detail_semibold_14, detail_medium_14, detail_regular_14, detail_smbold_12, detail_regular_10
    case normal_12


    var rawValue: String {
        switch self {
        case .head_bold_20, .subtitle_bold_17, .number_bold_27, .body_bold_16, .body_bold_15, .detail_bold_14: return "AppleSDGothicNeo-Bold"
        case .subtitle_smbold_18, .body_smbold_16, .detail_semibold_14, .detail_smbold_12:
            return "AppleSDGothicNeo-Semibold"
        case .body_medium_15, .detail_medium_14:
            return "AppleSDGothicNeo-Medium"
        case .body_regular_15, .detail_regular_14, .detail_regular_10: return "AppleSDGothicNeo-Regular"
        case .normal_12: return "Apple SD Gothic Neo"
        }
    }

    var size: CGFloat {
        switch self {
        case .detail_regular_10: return 10
        case .detail_smbold_12: return 12
        case .detail_smbold_12, .normal_12: return 12
        case .detail_regular_14, .detail_medium_14, .detail_semibold_14, .detail_bold_14: return 14
        case .body_regular_15, .body_medium_15, .body_bold_15: return 15
        case .body_bold_16, .body_smbold_16: return 16
        case .subtitle_bold_17: return 17
        case .subtitle_smbold_18: return 18
        case .head_bold_20: return 20
        case .number_bold_27: return 27        }
    }
}
extension UIFont {
    static func font(_ style: FontName) -> UIFont {
        return UIFont(name: style.rawValue, size: style.size)!
    }
}
