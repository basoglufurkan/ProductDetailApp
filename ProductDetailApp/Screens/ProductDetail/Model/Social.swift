//
//  Social.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import Foundation

// MARK: - Social
struct Social: Codable {
    let likeCount: Int
    let commentCounts: Comment

    enum CodingKeys: String, CodingKey {
        case likeCount
        case commentCounts
    }
}
