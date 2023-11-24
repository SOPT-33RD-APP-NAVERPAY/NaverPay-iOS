//
//  UIColor+.swift
//  NaverPay
//
//  Created by 곽성준 on 11/20/23.
//

import UIKit

extension UIColor {
    
    static var main_lightgreen: UIColor {
        return UIColor(hex: "#3BE084")
    }
    static var main_green: UIColor {
        return UIColor(hex: "#05AA5B")
    }
    static var main_green2: UIColor {
        return UIColor(hex: "#04B761")
    }
    static var sub_gd: UIColor {
        return UIColor(hex: "#06AA65")
    }
    static var sub_palegreen: UIColor {
        return UIColor(hex: "#EEF9F3")
    }
    static var sub_palegreen2: UIColor {
        return UIColor(hex: "#E2F6EC")
    }
    static var sub_darkgreen: UIColor {
        return UIColor(hex: "#098866")
    }
    static var sub_darkgreen2: UIColor {
        return UIColor(hex: "#004131")
    }
    static var main_darkgreen3: UIColor {
        return UIColor(hex: "#002F1E")
    }
    static var sub_black: UIColor {
        return UIColor(hex: "#000000")
    }
    static var sub_gd1: UIColor {
        return UIColor(hex: "#24D785")
    }
    static var sub_gd2: UIColor {
        return UIColor(hex: "#0AD6B4")
    }
    static var sub_gd3: UIColor {
        return UIColor(hex: "#02B7E1")
    }
    static var sub_gd4: UIColor {
        return UIColor(hex: "#3DAAFE")
    }
    static var bg_gd: UIColor {
        return UIColor(hex: "#F4F6F8")
    }
    static var bg_gray: UIColor {
        return UIColor(hex: "#EDEFF2")
    }
    static var bg_black: UIColor {
        return UIColor(hex: "#0D131C")
    }
    static var bg_white: UIColor {
        return UIColor(hex: "#FFFFFF")
    }
    static var main_home_cardline: UIColor {
        return UIColor(hex: "#3BE084")
    }
    static var sub_black20: UIColor {
        return UIColor(hex: "#000000")
    }
    static var sub_black30: UIColor {
        return UIColor(hex: "#000000")
    }
    static var adcard_yellow: UIColor {
        return UIColor(hex: "#15387F")
    }
    static var adcard_blue: UIColor {
        return UIColor(hex: "#15387F")
    }
    static var adcard_orange: UIColor {
        return UIColor(hex: "#F26521")
    }
    static var graph_main: UIColor {
        return UIColor(hex: "#04C759")
    }
    static var graph_review: UIColor {
        return UIColor(hex: "#05AA7F")
    }
    static var graph_payment: UIColor {
        return UIColor(hex: "#09ABA6")
    }
    static var graph_membership: UIColor {
        return UIColor(hex: "#1BA2F3")
    }
    static var grayscale_gray1: UIColor {
        return UIColor(hex: "#F3F5F7")
    }
    static var grayscale_gray2: UIColor {
        return UIColor(hex: "#EFEFF0")
    }
    static var grayscale_gray3: UIColor {
        return UIColor(hex: "#E9E9E9")
    }
    static var grayscale_gray4: UIColor {
        return UIColor(hex: "#BBBBBD")
    }
    static var grayscale_gray5: UIColor {
        return UIColor(hex: "#929294")
    }
    static var grayscale_gray6: UIColor {
        return UIColor(hex: "#828385")
    }
    static var grayscale_gray7: UIColor {
        return UIColor(hex: "#5D5D5D")
    }
    static var tous_les_bg: UIColor {
        return UIColor(hex: "#00472E")
    }
    static var cu_bg: UIColor {
        return UIColor(hex: "#6D2993")
    }
    static var pb_bg: UIColor {
        return UIColor(hex: "#003985")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
