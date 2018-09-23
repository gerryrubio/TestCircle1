//
//  ViewController.swift
//  TestCircle1
//
//  Created by Gerry Rubio on 2/19/18.
//  Copyright © 2018 Gerry Rubio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var theRect:CGRect!
    let frameWidth:CGFloat = 300.0
    let frameHeight:CGFloat = 300.0
    var commonShapeLayer: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   //     let myRecView = createRecView()
   //     createAllCircles(myRecView: myRecView)
   //     view.addSubview(myRecView)
        newAnimation5()
        
    }
    
    func newAnimation8() {
        let ovalShapeLayer1 = CAShapeLayer()
        let ovalShapeLayer2 = CAShapeLayer()
        ovalShapeLayer1.fillColor = UIColor.clear.cgColor
        let refreshRadius = view.frame.size.height/2
        let point1 = CGPoint(x: view.center.x, y: view.center.y)
        ovalShapeLayer1.path = UIBezierPath(arcCenter: point1, radius: refreshRadius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true).cgPath
        ovalShapeLayer2.path = UIBezierPath(arcCenter: point1, radius: refreshRadius - (refreshRadius * 0.80), startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true).cgPath
        
        
        ovalShapeLayer1.shadowPath = ovalShapeLayer1.path
        ovalShapeLayer1.shadowOpacity = 0.4
        ovalShapeLayer1.shadowColor = UIColor.green.cgColor
        view.layer.addSublayer(ovalShapeLayer1)
        
        ovalShapeLayer2.shadowPath = ovalShapeLayer2.path
        view.layer.addSublayer(ovalShapeLayer2)
        ovalShapeLayer2.strokeColor = UIColor.clear.cgColor
        ovalShapeLayer2.fillColor = UIColor.green.cgColor
        
        let basicAnimationStart = CABasicAnimation(keyPath: "shadowPath")
        basicAnimationStart.fromValue = ovalShapeLayer2.path
        basicAnimationStart.toValue = ovalShapeLayer1.path
  //      basicAnimationStart.toValue = ovalShapeLayer2.path
        basicAnimationStart.duration = 2
        basicAnimationStart.repeatCount = MAXFLOAT
        basicAnimationStart.fillMode = kCAFillModeForwards
        ovalShapeLayer1.add(basicAnimationStart, forKey: nil)
    }
    
    func newAnimation7() {
        let ovalShapeLayer = CAShapeLayer()
        ovalShapeLayer.strokeColor = UIColor.black.cgColor
        ovalShapeLayer.fillColor = UIColor.clear.cgColor
        ovalShapeLayer.lineWidth = 4.0
    //    ovalShapeLayer.lineDashPattern = [10,5]
        let refreshRadius = view.frame.size.height/2 * 0.5
        let point1 = CGPoint(x: view.center.x, y: view.center.y)
        ovalShapeLayer.path = UIBezierPath(arcCenter: point1, radius: refreshRadius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true).cgPath
        
        view.layer.addSublayer(ovalShapeLayer)
        
        let basicAnimationStart = CABasicAnimation(keyPath: "strokeStart")
        basicAnimationStart.fromValue = -0.1
        basicAnimationStart.toValue = 1.0
        basicAnimationStart.fillMode = kCAFillModeForwards

        
        let basicAnimationEnd = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimationEnd.fromValue = 0.0
        basicAnimationEnd.toValue = 1.0
        basicAnimationEnd.fillMode = kCAFillModeForwards

        
        let strokeAnimationGroup = CAAnimationGroup()
        strokeAnimationGroup.duration = 3
        strokeAnimationGroup.repeatCount = MAXFLOAT
        strokeAnimationGroup.animations = [basicAnimationStart,basicAnimationEnd]
        
        ovalShapeLayer.add(strokeAnimationGroup, forKey: nil)
    }
    
    func newAnimation6() {
        let ovalShapeLayer = CAShapeLayer()
        ovalShapeLayer.strokeColor = UIColor.orange.cgColor
        ovalShapeLayer.fillColor = UIColor.clear.cgColor
        ovalShapeLayer.lineWidth = 20.0
        ovalShapeLayer.lineDashPattern = [2,3]
        let refreshRadius = view.frame.size.height/2 * 0.5
        let point1 = CGPoint(x: view.center.x, y: view.center.y)
        ovalShapeLayer.path = UIBezierPath(arcCenter: point1, radius: refreshRadius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true).cgPath
        view.layer.addSublayer(ovalShapeLayer)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.fromValue = 0
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.repeatCount = MAXFLOAT
        
        ovalShapeLayer.add(basicAnimation, forKey: nil)
    }
    
    func newAnimation5() {
        //circlePath will be ued by the circleLayer to draw the orbit circle.
        // Will also be used by the animation to pave the path to move the object along the orbit circle
        let circlePath1 = UIBezierPath(arcCenter: view.center, radius: 60, startAngle: 0, endAngle: .pi*2, clockwise: true)
        let circlePath2 = UIBezierPath(arcCenter: view.center, radius: 90, startAngle: 0, endAngle: .pi*2, clockwise: true)
        let circlePath3 = UIBezierPath(arcCenter: view.center, radius: 120, startAngle: 0, endAngle: .pi*2, clockwise: false)
        
        let sunPath = UIBezierPath(arcCenter: view.center, radius: 25, startAngle: 0, endAngle: .pi*2, clockwise: true)
        
        let animation1 = CAKeyframeAnimation(keyPath: "position")
        animation1.duration = 5
        animation1.repeatCount = MAXFLOAT
        animation1.path = circlePath1.cgPath
        
        let ballLayer1 = CAShapeLayer()
        ballLayer1.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 5, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        ballLayer1.fillColor = UIColor.blue.cgColor
        view.layer.addSublayer(ballLayer1)
        ballLayer1.zPosition = 2
        // You can also pass any unique string value for key
        ballLayer1.add(animation1, forKey: nil)
        
        // circleLayer is only used to locate the circle animation path
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath1.cgPath
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.lineWidth = 0.25
        circleLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(circleLayer)
        //-----------------------------------------
        
        let animation2 = CAKeyframeAnimation(keyPath: "position")
        animation2.duration = 10
        animation2.repeatCount = MAXFLOAT
        animation2.path = circlePath2.cgPath
        
        let ballLayer2 = CAShapeLayer()
        ballLayer2.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 15, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        ballLayer2.fillColor = UIColor.green.cgColor
        view.layer.addSublayer(ballLayer2)
        // You can also pass any unique string value for key
        ballLayer2.add(animation2, forKey: nil)
    
        // circleLayer is only used to locate the circle animation path
        let circleLayer2 = CAShapeLayer()
        circleLayer2.path = circlePath2.cgPath
        circleLayer2.strokeColor = UIColor.black.cgColor
        circleLayer2.lineWidth = 0.25
        circleLayer2.fillColor = UIColor.clear.cgColor
        circleLayer2.zPosition = -1
        view.layer.addSublayer(circleLayer2)
        //-----------------------------------------
        
        // circleLayer is only used to locate the circle animation path
        let circleLayer3 = CAShapeLayer()
        circleLayer3.path = circlePath3.cgPath
        circleLayer3.strokeColor = UIColor.black.cgColor
        circleLayer3.lineWidth = 0.25
        circleLayer3.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(circleLayer3)
        
        let animation3 = CAKeyframeAnimation(keyPath: "position")
        animation3.duration = 15
        animation3.repeatCount = MAXFLOAT
        animation3.path = circlePath3.cgPath
        
        let ballLayer3 = CAShapeLayer()
        ballLayer3.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 10, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        ballLayer3.fillColor = UIColor.magenta.cgColor
        view.layer.addSublayer(ballLayer3)
        // You can also pass any unique string value for key
        ballLayer3.add(animation3, forKey: nil)
        /*
        // circleLayer is only used to locate the circle animation path
        let circleLayer3 = CAShapeLayer()
        circleLayer3.path = circlePath3.cgPath
        circleLayer3.strokeColor = UIColor.black.cgColor
        circleLayer3.lineWidth = 0.25
        circleLayer3.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(circleLayer3)
        */
        // sun is only used to draw the orange sun circle
        let sunLayer = CAShapeLayer()
        sunLayer.path = sunPath.cgPath
        sunLayer.strokeColor = UIColor.orange.cgColor
        sunLayer.lineWidth = 1
        sunLayer.fillColor = UIColor.orange.cgColor
        view.layer.addSublayer(sunLayer)
    }
    
    func newAnimation4() {
        //circlePath will be ued by the circleLayer to draw the orbit circle.
        // Will also be used by the animation to pave the path to move the object along the orbit circle
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 60, startAngle: 0, endAngle: .pi*2, clockwise: true)
        
        let sunPath = UIBezierPath(arcCenter: view.center, radius: 20, startAngle: 0, endAngle: .pi*2, clockwise: true)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 5
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        
        let ballLayer = CAShapeLayer()
        ballLayer.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 10, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        ballLayer.fillColor = UIColor.blue.cgColor
        view.layer.addSublayer(ballLayer)
        // You can also pass any unique string value for key
        ballLayer.add(animation, forKey: nil)
        
        
        
        // circleLayer is only used to locate the circle animation path
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.lineWidth = 0.25
        circleLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(circleLayer)
        
        // sun is only used to draw the orange sun circle
        let sunLayer = CAShapeLayer()
        sunLayer.path = sunPath.cgPath
        sunLayer.strokeColor = UIColor.orange.cgColor
        sunLayer.lineWidth = 1
        sunLayer.fillColor = UIColor.orange.cgColor
        view.layer.addSublayer(sunLayer)
    }
    
    func newAnimation3() {
        //circlePath will be ued by the circleLayer to draw the orbit circle.
        // Will also be used by the animation to pave the path to move the object along the orbit circle
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 60, startAngle: 0, endAngle: .pi*2, clockwise: true)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 5
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        
        let ballLayer = CAShapeLayer()
        ballLayer.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 10, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        ballLayer.fillColor = UIColor.blue.cgColor
        view.layer.addSublayer(ballLayer)
        // You can also pass any unique string value for key
        ballLayer.add(animation, forKey: nil)
        
        // circleLayer is only used to locate the circle animation path
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.lineWidth = 0.25
        circleLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(circleLayer)
    }
    
    func newAnimation() {
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 20, startAngle: 0, endAngle: .pi*2, clockwise: true)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 1
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        
        let squareView = UIView()
        //whatever the value of origin for squareView will not affect the animation
        squareView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        squareView.backgroundColor = .lightGray
        view.addSubview(squareView)
        // You can also pass any unique string value for key
        squareView.layer.add(animation, forKey: nil)
        
        // circleLayer is only used to locate the circle animation path
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(circleLayer)
    }

    func createRecView() -> UIView {
        theRect = CGRect(x: (view.frame.width / 2) - (frameWidth / 2),
                         y: (view.frame.height / 2) - (frameHeight / 2),
                         width: frameWidth,
                         height: frameHeight)
        let myRecView = UIView(frame: theRect)
        myRecView.backgroundColor = UIColor.red
        return myRecView
    }

    func createCircleView(rect: CGRect, color: UIColor, parentView: UIView?) -> UIView {
        let myCircle = CircleUIView(frame: rect)
        let shapeLayer = myCircle.createCircle(rect, color: color )
        if parentView != nil {
            parentView?.layer.addSublayer(shapeLayer)
        }
        self.commonShapeLayer = shapeLayer
        return myCircle
    }

}

