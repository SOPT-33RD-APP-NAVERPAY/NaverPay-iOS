//
//  NetworkRequest.swift
//  NaverPay
//
//  Created by 곽성준 on 11/28/23.
//

import Foundation

struct NetworkRequest {
    let path: String
    let httpMethod: HttpMethod
    let query: Codable?
    let body: Data?
    let header: [String: String]?
    
    init(path: String, httpMethod: HttpMethod, query: Codable? = nil, body: Data? = nil, header: [String : String]? = nil) {
        self.path = path
        self.httpMethod = httpMethod
        self.query = query
        self.body = body
        self.header = header
    }
    
    //예시
    func makeURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(string: Config.baseURL)
        
        //쿼리에 들어갈 것을 바로 딕셔너리로 넣어주는 것이 아니라,
        //구조체를 만들어두고 toDictionary()를 활용해서 딕셔너리로 변환시켜주고 쿼리에 넣어준다
        //아래와 같은 구조체를 선언해두고, NetworkRequest(여기에 넣어주고 값만 설정해준다.)
//        struct queryStruct: Codable {
//            let name: String
//            let age: Int
//        }
        
        if let query = self.query {
            let queries = query.toDictionary()
            let queryItemArray = queries.map {
                return URLQueryItem(name: $0.key, value: "\($0.value)")
            }
            urlComponents?.queryItems = queryItemArray
        }
      
//        let queryItemArray = [URLQueryItem(name: "q", value: cityName),
//                              URLQueryItem(name: "cnt", value: "14"),
//                              URLQueryItem(name: "lang", value: "kr"),
//                              URLQueryItem(name: "units", value: "metric")]
//        
//        urlComponents?.queryItems = queryItemArray
        
        guard let urlRequestURL = urlComponents?.url?.appendingPathComponent(self.path) else {
            throw NetworkError.urlEncodingError
        }
        
        var urlRequest = URLRequest(url: urlRequestURL)
        urlRequest.httpMethod = self.httpMethod.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue("1", forHTTPHeaderField: HTTPHeaderField.xAuthID.rawValue)
        urlRequest.httpBody = self.body
        return urlRequest
    }
}



