//
//  CircularProgressBarView.swift
//  ProductDetailApp
//
//  Created by Furkan BAŞOĞLU on 5.11.2023.
//

import Foundation
import UIKit

class CircularProgressBarView: UIView {
    
    // MARK: - Properties -
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func createCircularPath() {
        // created circularPath for circleLayer and progressLayer
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: frame.size.height / 2.0, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        let circularPathOrange = UIBezierPath(arcCenter: CGPoint(x: (frame.size.width / 2.0), y: (frame.size.height / 2.0)), radius: (frame.size.height / 2.0)-2, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        circleLayer.removeFromSuperlayer()
        progressLayer.removeFromSuperlayer()
        // circleLayer path defined to circularPath
        circleLayer.path = circularPath.cgPath
        // ui edits
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 8.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = Constants.Colors.progressBg.cgColor
        // added circleLayer to layer
        layer.addSublayer(circleLayer)
        // progressLayer path defined to circularPath
        progressLayer.path = circularPathOrange.cgPath
        // ui edits
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 9.0
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = Constants.Colors.progressSelected.cgColor
        // added progressLayer to layer
        layer.addSublayer(progressLayer)
    }
    
    func progressAnimation(duration: TimeInterval) {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
