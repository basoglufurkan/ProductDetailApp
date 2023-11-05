//
//  ProductTitleTableCellViewModel.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import Foundation

struct ProductTitleTableCellViewModel: ProductDetailsCellViewModel {
    var cell: DetailCell
    var title: String
    var desc: String
    var likeCount: Int
}
