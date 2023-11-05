//
//  ProductRatingTableCellViewModel.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import Foundation

struct ProductRatingTableCellViewModel: ProductDetailsCellViewModel {
    var cell: DetailCell
    var rating: Int
    var reviews: Int
}
