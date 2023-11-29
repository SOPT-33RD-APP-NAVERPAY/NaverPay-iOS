//
//  HomeService.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/29.
//

import Foundation

final class HomeService: Serviceable {
    static let shared = HomeService()

    private init() {}

    func getHomeInfo() async throws -> HomeDataAppData {
        let urlRequest = try NetworkRequest(path: "/", httpMethod: .get).makeURLRequest()

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

//        let urlResponse = response as? HTTPURLResponse
//        let status = urlResponse?.statusCode
        
        guard let model = try dataDecodeAndhandleErrorCode(data: data, decodeType: HomeDTO.self) else { return HomeDataAppData.emptyData }

        return model.toAppData()
    }
}
