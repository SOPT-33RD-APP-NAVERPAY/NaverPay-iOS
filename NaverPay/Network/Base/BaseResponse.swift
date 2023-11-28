//
//  BaseResponse.swift
//  NaverPay
//
//  Created by 곽성준 on 11/28/23.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String
    let data: T?
}
