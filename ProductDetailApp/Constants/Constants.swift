//
//  Constants.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import Foundation
import UIKit

struct Constants {
    
    struct Images {
        static let starEmpty = UIImage(named: "iconStar")
        static let starHighlighted = UIImage(named: "iconStarFill")
    }
    
    struct Colors {
        static let progressBg = UIColor(red: 240.0/255, green: 240.0/255, blue: 240.0/255, alpha: 1)
        static let progressSelected = UIColor(red: 240.0/255, green: 186/255, blue: 72/255, alpha: 1)
    }
    
    struct StaticText {
        static let reviewsString: String = "Yorum"
    }
    
    struct Numberic {
        static let socialUpdateTime: Double = 60
        static let numberOfStars: Int = 5
    }
    
}

enum LocalFile: String {
    case product = "product"
    case social = "social"
    case none = "none"
}

enum DetailCell {
    case image
    case title
    case rating
    case amount
    
    var cellIdentifier: String {
        switch self {
        case .image:
            return "ProductImageTableViewCell"
        case .title:
            return "ProductTitleTableViewCell"
        case .rating:
            return "ProductRatingTableViewCell"
        case .amount:
            return "ProductAmountTableViewCell"
        }
    }
    
    var nib: UINib {
        switch self {
        case .image:
            return UINib(nibName: "ProductImageTableViewCell", bundle: nil)
        case .title:
            return UINib(nibName: "ProductTitleTableViewCell", bundle: nil)
        case .rating:
            return UINib(nibName: "ProductRatingTableViewCell", bundle: nil)
        case .amount:
            return UINib(nibName: "ProductAmountTableViewCell", bundle: nil)
        }
    }
}

