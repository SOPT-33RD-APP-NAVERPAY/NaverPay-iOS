//
//  KingfisherService.swift
//  NaverPay
//
//  Created by 곽성준 on 11/29/23.
//

import UIKit

import Kingfisher

final class NPKingFisherService {
    
    static func fetchImage(with urlString: String) async throws -> UIImage? {
        typealias ImageContinuation = CheckedContinuation<UIImage?, Error>
        
        return try await withCheckedThrowingContinuation { ImageContinuation in
            
            guard let url = URL(string: urlString) else {
                return ImageContinuation.resume(throwing: NetworkError.urlEncodingError)
            }
            
            let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
            KingfisherManager.shared.retrieveImage(with: resource) { result in
                switch result {
                case .success(let imageResult):
                    let image = imageResult.image
                    return ImageContinuation.resume(returning: image)
                case .failure(_):
                    return ImageContinuation.resume(throwing: NetworkError.fetchImageError)
                }
            }
        }
        
    }
}
