//
//  UIViewExtensions.swift
//  Focus
//
//  Created by Michael Danylchuk on 3/19/17.
//  Copyright © 2017 Group. All rights reserved.
//
// This file DONE BY MICHAEL DANYLCHUK

import Foundation
import UIKit

extension UIView {
    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate! = delegate as! CAAnimationDelegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
    func rotateclock(duration: CFTimeInterval = Double(FP_INFINITE), completionDelegate: AnyObject? = nil){
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate! = delegate as! CAAnimationDelegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
