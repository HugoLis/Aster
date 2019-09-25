//
//  Paths.swift
//  Reach
//
//  Created by Hugo Lispector on 25/09/19.
//  Copyright © 2019 Turma Tarde. All rights reserved.
//

import SpriteKit

class Paths{
//    var rocket = UIBezierPath()
    var star = UIBezierPath()
    
    init() {
//        rocket.move(to: CGPoint(x: 48, y: 5)) //18
//        rocket.addLine(to: CGPoint(x: 82.4, y: 62.52))
//        rocket.addLine(to: CGPoint(x: 90.9, y: 162.56))
//        rocket.addLine(to: CGPoint(x: 67.09, y: 242.79))
//        rocket.addLine(to: CGPoint(x: 28.91, y: 242.79))
//        rocket.addLine(to: CGPoint(x: 5.1, y: 162.56))
//        rocket.addLine(to: CGPoint(x: 13.6, y: 62.52))
//        rocket.close()
//
//        let rocketTranslateTransform = CGAffineTransform(translationX: -96.933/2, y: -254.308) //x: -96.933/2, y: -254.308/2
//        let rocketYInverseTransform = CGAffineTransform(scaleX: 0.15, y: -0.15) //1, -1
//        rocket.apply(rocketTranslateTransform)
//        rocket.apply(rocketYInverseTransform)
        
        
        
        star.move(to: CGPoint(x: 312.5, y: 223.07))
        star.addCurve(to: CGPoint(x: 274.12, y: 234.54), controlPoint1: CGPoint(x: 288.78, y: 231.69), controlPoint2: CGPoint(x: 275.99, y: 235.51))
        star.addCurve(to: CGPoint(x: 273.54, y: 194.35), controlPoint1: CGPoint(x: 272.25, y: 233.56), controlPoint2: CGPoint(x: 272.06, y: 220.17))
        star.addCurve(to: CGPoint(x: 249.73, y: 160.99), controlPoint1: CGPoint(x: 257.22, y: 174.36), controlPoint2: CGPoint(x: 249.28, y: 163.24))
        star.addCurve(to: CGPoint(x: 288.42, y: 147.87), controlPoint1: CGPoint(x: 250.17, y: 158.75), controlPoint2: CGPoint(x: 263.07, y: 154.37))
        star.addCurve(to: CGPoint(x: 312.5, y: 115), controlPoint1: CGPoint(x: 302.34, y: 125.96), controlPoint2: CGPoint(x: 310.36, y: 115))
        star.addCurve(to: CGPoint(x: 336.58, y: 147.87), controlPoint1: CGPoint(x: 314.64, y: 115), controlPoint2: CGPoint(x: 322.66, y: 125.96))
        star.addCurve(to: CGPoint(x: 374.79, y: 162.7), controlPoint1: CGPoint(x: 362.05, y: 155.16), controlPoint2: CGPoint(x: 374.79, y: 160.1))
        star.addCurve(to: CGPoint(x: 351.46, y: 194.35), controlPoint1: CGPoint(x: 374.79, y: 165.29), controlPoint2: CGPoint(x: 367.02, y: 175.84))
        star.addCurve(to: CGPoint(x: 351.46, y: 234.54), controlPoint1: CGPoint(x: 352.87, y: 220.01), controlPoint2: CGPoint(x: 352.87, y: 233.4))
        star.addCurve(to: CGPoint(x: 312.5, y: 223.07), controlPoint1: CGPoint(x: 350.05, y: 235.67), controlPoint2: CGPoint(x: 337.06, y: 231.85))
        star.close()
        
        let starTranslateTransform = CGAffineTransform(translationX: -312, y: -176) //x: -96.933/2, y: -254.308/2
        let starYInverseTransform = CGAffineTransform(scaleX: 0.4, y: -0.4) //1, -1
        star.apply(starTranslateTransform)
        star.apply(starYInverseTransform)
    }

}
