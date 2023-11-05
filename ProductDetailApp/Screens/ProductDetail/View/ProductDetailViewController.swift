//
//  ProductDetailViewController.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 3.11.2023.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    lazy var viewModel = {
        ProductDetailsViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initViewModel()
    }
    
    func initView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorColor = .white
        mainTableView.separatorStyle = .singleLine
        mainTableView.tableFooterView = UIView()
        mainTableView.allowsSelection = false

        mainTableView.register(DetailCell.image.nib, forCellReuseIdentifier: DetailCell.image.cellIdentifier)
        mainTableView.register(DetailCell.title.nib, forCellReuseIdentifier: DetailCell.title.cellIdentifier)
        mainTableView.register(DetailCell.rating.nib, forCellReuseIdentifier: DetailCell.rating.cellIdentifier)
        mainTableView.register(DetailCell.amount.nib, forCellReuseIdentifier: DetailCell.amount.cellIdentifier)
    }

    func initViewModel() {
        // Get product data
        viewModel.getBasicDetails()
        
        // Reload TableView closure
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.mainTableView.reloadData()
            }
        }
    }
    
    func updateSocialData() {
        /// Get Social Data
        viewModel.getSocialDetails()
    }
}
// MARK: - UITableViewDelegate

extension ProductDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource

extension ProductDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.detailsCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellVM.cell.cellIdentifier, for: indexPath) as? ProductDetailsTableViewCell else { fatalError("xib does not exists") }
        cell.viewModel = cellVM
        if cellVM.cell == .amount {
            
        }
        if let amountCell = cell as? ProductAmountTableViewCell {
            amountCell.reloadSocialData = { [weak self] in
                self?.updateSocialData()
            }
        }
        return cell
    }
}
