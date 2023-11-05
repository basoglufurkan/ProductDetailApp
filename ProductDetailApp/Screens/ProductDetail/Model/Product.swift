//
//  Product.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import Foundation

//typealias Details = [ProductDetails]

//struct ProductDetails {
//
//}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let name: String
    let desc: String
    let image: String
    let price: Price

    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case desc = "desc"
        case image = "image"
        case price
    }
}

//protocol ProductDetails: Codable {
//
//}
