//
//  Comment.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import Foundation

// MARK: - Comment
struct Comment: Codable {
    let rating: Int
    let anonymousCommentsCount: Int
    let memberCommentsCount: Int

    enum CodingKeys: String, CodingKey {
        case rating = "averageRating"
        case anonymousCommentsCount
        case memberCommentsCount
    }
}
