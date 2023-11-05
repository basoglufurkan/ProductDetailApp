//
//  ProductDetailsViewModel.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import Foundation

class ProductDetailsViewModel: NSObject {
    
    private var productService: ProductDetailsServiceProtocol
    var reloadTableView: (() -> Void)?
    var product: Product?
    var social: Social?
    
    var detailsCellViewModels = [ProductDetailsCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }

    init(productService: ProductDetailsServiceProtocol = ProductDetailsService()) {
        self.productService = productService
    }
    
    func getBasicDetails() {
        productService.getBasicDetails(completion: { success, results, error in
            if success, let product = results {
                self.fetchData(product: product)
            } else {
                print(error!)
            }
        })
        self.getSocialDetails()
    }
    
    func getSocialDetails() {
        productService.getSocialDetails(completion: { success, results, error in
            if success, let social = results {
                self.fetchData(social: social)
            } else {
                print(error!)
            }
        })
    }
    
    func fetchData(product: Product) {
        self.product = product// Cache
        self.updateCellModels()
    }
    
    func fetchData(social: Social) {
        /// Social Data Update
        self.social = social // Cache
        self.updateCellModels()
    }
    
    func updateCellModels() {
        var vms = [ProductDetailsCellViewModel]()
        detailsCellViewModels.removeAll()
        if product != nil && social != nil {
            vms = createCellModels()
        }
        detailsCellViewModels = vms
    }
    
    /// create cell view model
    func createCellModels() -> [ProductDetailsCellViewModel] {
        let image: String = product?.image ?? ""
        let name: String = product?.name ?? ""
        let desc: String = product?.desc ?? ""
        let likeCount: Int = social?.likeCount ?? 0
        let rating: Int = social?.commentCounts.rating ?? 0
        let memberReviews: Int = social?.commentCounts.memberCommentsCount ?? 0
        let anonymousReviews: Int = social?.commentCounts.anonymousCommentsCount ?? 0
        let price: Int = product?.price.value ?? 0
        let currency: String = product?.price.currency ?? ""
        var vms: [ProductDetailsCellViewModel] = []
        let imageVM = ProductImageTableCellViewModel(cell: .image, image: image)
        let titleVM = ProductTitleTableCellViewModel(cell: .title, title: name, desc: desc, likeCount: likeCount)
        let ratingVM = ProductRatingTableCellViewModel(cell: .rating, rating: rating, reviews: memberReviews+anonymousReviews)
        let amountVM = ProductAmountTableCellViewModel(cell: .amount, amount: "\(Double(price))\(currency)")
        vms.append(imageVM)
        vms.append(titleVM)
        vms.append(ratingVM)
        vms.append(amountVM)
        return vms
    }
    
    /// Position wise cell model
    func getCellViewModel(at indexPath: IndexPath) -> ProductDetailsCellViewModel {
        return detailsCellViewModels[indexPath.row]
    }
}
