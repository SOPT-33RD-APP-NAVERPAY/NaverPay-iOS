//
//  BenefitService.swift
//  NaverPay
//
//  Created by 곽성준 on 11/29/23.
//

import Foundation

final class BenefitService: Serviceable {
    static let shared = BenefitService()
    
    private init() {}
    
    func getBenefitMainInfo() async throws -> UserBenefitDataAppData {
        let urlRequest = try NetworkRequest(path: "/benefit", httpMethod: .get).makeURLRequest()
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
//        let urlResponse = response as? HTTPURLResponse
//        let status = urlResponse?.statusCode
        
        guard let model = try dataDecodeAndhandleErrorCode(data: data, decodeType: BenefitMainDTO.self) else { return UserBenefitDataAppData.emptyData }
        
        return model.toAppData()
        
    }
    
    
}