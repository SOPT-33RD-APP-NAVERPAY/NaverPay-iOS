//
//  PointService.swift
//  NaverPay
//
//  Created by 이자민 on 11/30/23.
//

import Foundation

final class PointService: Serviceable {
    static let shared = PointService()
    
    private init() {}
    
    func getPointMainInfo() async throws -> UserPointAppData {
        let urlRequest = try NetworkRequest(path: "/point", httpMethod: .get).makeURLRequest()
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
//        let urlResponse = response as? HTTPURLResponse
//        let status = urlResponse?.statusCode
        
        guard let model = try dataDecodeAndhandleErrorCode(data: data, decodeType: PointMainDTO.self) else { return UserPointAppData.emptyData }
        
        return model.toAppData()
    }
    
    
}
