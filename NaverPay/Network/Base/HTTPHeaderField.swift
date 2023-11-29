//
//  HTTPHeaderField.swift
//  NaverPay
//
//  Created by 곽성준 on 11/28/23.
//

import Foundation


enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case xAuthID = "X-Auth-id"
}

enum ContentType: String {
    case json = "Application/json"
}
