//
//  Serviceable.swift
//  NaverPay
//
//  Created by 곽성준 on 11/29/23.
//

import Foundation


/// 서비스 객체에서 필수로 채택해줘야 하는 프로토콜
protocol Serviceable {
    /// 네트워크 통신 중 생긴 에러를 우리가 만든 에러모델로 던지는 메서드
    /// - Parameters:
    ///   - data: Data타입의 통신 결과
    ///   - decodeType: Data타입의 통신결과를 해당 타입으로 decode
    func dataDecodeAndhandleErrorCode<T: Codable>(data: Data, decodeType: T.Type) throws -> T?
}

extension Serviceable {
    @discardableResult
    func dataDecodeAndhandleErrorCode<T: Codable>(data: Data, decodeType: T.Type) throws -> T? {

        guard let model = try? JSONDecoder().decode(BaseResponse<T>.self, from: data) else {
            throw NetworkError.jsonDecodingError
        }

        
        
        if model.status == 400 || model.status == 401 {
            throw NetworkError.clientError(message: model.message)
        }
            
        print("""
        -------------------------------------------------------------
        statusCode : \(model.status)
        message : \(model.message)
        -------------------------------------------------------------
        """)
        
        return model.data
    }
}
