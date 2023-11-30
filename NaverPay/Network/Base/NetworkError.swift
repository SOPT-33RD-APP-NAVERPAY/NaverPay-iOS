//
//  NetworkError.swift
//  NaverPay
//
//  Created by 곽성준 on 11/28/23.
//

import Foundation

@frozen
enum NetworkError: Error, CustomStringConvertible {
    case urlEncodingError
    case jsonDecodingError
    case badCasting
    case fetchImageError
    case clientError
    case serverError
    
    var description: String {
        switch self {
        case .urlEncodingError:
            return "🔒URL Encoding 에러입니다"
        case .jsonDecodingError:
            return "🔐JSON Decoding 에러입니다"
        case .badCasting:
            return "❌잘못된 타입 캐스팅입니다 (HTTPResponse)"
        case .fetchImageError:
            return "🌄Image URL로부터 불러오기 실패"
        case .clientError:
            return "📱클라이언트 에러"
        case .serverError:
            return "🖥️서버 에러"
        }
    }
}
