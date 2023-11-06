//
//  ProductImageTableViewCell.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 3.11.2023.
//

import UIKit

class ProductDetailsTableViewCell: UITableViewCell {
    var viewModel: ProductDetailsCellViewModel?
    
    init(viewModel: ProductDetailsCellViewModel) {
        super.init(style: .default, reuseIdentifier: "ProductDetailsCellViewModel")
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

class ProductImageTableViewCell: ProductDetailsTableViewCell {

    @IBOutlet weak var productImage: UIImageView!

    override var viewModel: ProductDetailsCellViewModel? {
        didSet {
            guard let cellViewModel = viewModel as? ProductImageTableCellViewModel else {return}
            productImage.image = UIImage(named: cellViewModel.image)
            let downloader = ImageDownloadHelper.shared
            downloader.image(urlString: cellViewModel.image) { data  in
                let img = downloader.image(data: data)
                DispatchQueue.main.async {[weak self] in
                    self?.productImage.image = img
                }
            }
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
        selectionStyle = .none
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImage.contentMode = .scaleAspectFill
    }

}
