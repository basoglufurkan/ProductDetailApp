//
//  ProductTitleTableViewCell.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 3.11.2023.
//

import UIKit

class ProductTitleTableViewCell: ProductDetailsTableViewCell {
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var productLikeCount: UILabel!
    
    override var viewModel: ProductDetailsCellViewModel? {
        didSet {
            guard let cellViewModel = viewModel as? ProductTitleTableCellViewModel else {return}
            productTitle.text = cellViewModel.title
            productDesc.text = cellViewModel.desc
            productLikeCount.text = "\(cellViewModel.likeCount)"
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
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productTitle.text = ""
        productDesc.text = ""
        productLikeCount.text = ""
    }
}
