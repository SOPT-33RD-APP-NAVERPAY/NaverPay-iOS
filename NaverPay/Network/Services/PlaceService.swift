//
//  PlaceService.swift
//  NaverPay
//
//  Created by 이자민 on 11/30/23.
//

import Foundation

final class PlaceService: Serviceable {
    static let shared = PlaceService()
    
    private init() {}
    
    func getPlaceMainInfo() async throws -> UserPlaceAppData {
        let urlRequest = try NetworkRequest(path: "/place", httpMethod: .get).makeURLRequest()
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
//        let urlResponse = response as? HTTPURLResponse
//        let status = urlResponse?.statusCode
        
        guard let model = try dataDecodeAndhandleErrorCode(data: data, decodeType: PlaceMainDTO.self) else { return UserPlaceAppData.emptyData }
        
        return model.toAppData()
    }
    
    
}
