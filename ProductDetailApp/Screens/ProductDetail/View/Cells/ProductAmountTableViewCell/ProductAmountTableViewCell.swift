//
//  ProductAmountTableViewCell.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import UIKit

class ProductAmountTableViewCell: ProductDetailsTableViewCell {
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var circularProgressBarView: CircularProgressBarView!
    @IBOutlet weak var updateTimer: UILabel!
    @IBOutlet weak var viewProgressContainer: UIView!
    
    var reloadSocialData: (() -> Void)?
    var updateDuration: TimeInterval = Constants.Numberic.socialUpdateTime
    var timer: Timer?

    override var viewModel: ProductDetailsCellViewModel? {
        didSet {
            guard let cellViewModel = viewModel as? ProductAmountTableCellViewModel else {return}
            productPrice.text = cellViewModel.amount
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }

    func initView() {
        selectionStyle = .none
        // Cell view customization
        backgroundColor = .clear
        // Line separator full width
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
        self.setUpCircularProgressBarView()
        startTimer()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        timer = nil
        productPrice.text = ""
        updateDuration = Constants.Numberic.socialUpdateTime
    }
    
    func setUpCircularProgressBarView() {
        // set view
        circularProgressBarView.createCircularPath()
        // align to the center of the screen
        circularProgressBarView.center = viewProgressContainer.center
        // call the animation with circularViewDuration
        circularProgressBarView.progressAnimation(duration: updateDuration)
        // add this view to the view controller
        viewProgressContainer.addSubview(circularProgressBarView)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
    }
    
    /// for api hit and ui update
    @objc func timerFired() {
        if updateDuration == 0 {
            updateDuration = Constants.Numberic.socialUpdateTime
            reloadSocialData?()
            circularProgressBarView.progressAnimation(duration: updateDuration)
        }
        updateTimer.text = "\(Int(updateDuration))"
        updateDuration -= 1
    }

}
