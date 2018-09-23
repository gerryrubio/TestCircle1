//
//  CircleUIView.swift
//  TestCircle1
//
//  Created by Gerry Rubio on 2/19/18.
//  Copyright © 2018 Gerry Rubio. All rights reserved.
//

import UIKit

class CircleUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func addBehavior() {
        print("Add all the behavior here")
    }
    /*
    func createCircle(_ rect: CGRect, color: UIColor) -> CAShapeLayer {
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(ovalIn: rect).cgPath
        circleLayer.position = CGPoint(x: 0, y: 0)
        circleLayer.fillColor = color.cgColor
        return circleLayer
    }
    */
    func createCircle(_ rect: CGRect, color: UIColor) -> CAShapeLayer {
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        circleLayer.fillColor = color.cgColor
        return circleLayer
    }
 
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
    }
    */

}
