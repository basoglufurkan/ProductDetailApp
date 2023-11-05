//
//  Price.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import Foundation

// MARK: - Price
struct Price: Codable {
    let value: Int
    let currency: String

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case currency = "currency"
    }
}
