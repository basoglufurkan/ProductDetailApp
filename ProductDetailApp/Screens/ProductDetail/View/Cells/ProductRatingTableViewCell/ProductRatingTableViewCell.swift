//
//  ProductRatingTableViewCell.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 3.11.2023.
//

import UIKit

class ProductRatingTableViewCell: ProductDetailsTableViewCell {

    
    @IBOutlet var star: [UIImageView]!
    @IBOutlet weak var productAverageRating: UILabel!
    @IBOutlet weak var productReviewCount: UILabel!

    override var viewModel: ProductDetailsCellViewModel? {
        didSet {
            guard let cellViewModel = viewModel as? ProductRatingTableCellViewModel else {return}
            productAverageRating.text = "\(cellViewModel.rating)"
            productReviewCount.text = " ( \(cellViewModel.reviews) \(Constants.StaticText.reviewsString) )"
            starHighlighten(ratings: cellViewModel.rating)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }

    func initView() {
        // Cell view customization
        backgroundColor = .clear
        // Line separator full width
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
        productAverageRating.textColor = Constants.Colors.progressSelected
        productReviewCount.textColor = Constants.Colors.progressSelected
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productAverageRating.text = ""
        productReviewCount.text = ""
    }
    
    private func starHighlighten(ratings: Int) {
        /// removed exisitng stars if exists
        /// loop through the number of our stars and add them to the stackView (starsContainer)
        for (index, ico) in star.enumerated() {
            if ratings > index {
                ico.isHighlighted = true
            } else {
                ico.isHighlighted = false
            }
        }
    }

}
