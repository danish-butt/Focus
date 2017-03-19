//
//  AnimationViewController.swift
//  Focus
//
//  Created by Michael Danylchuk on 3/18/17.
//  Copyright © 2017 Group. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    @IBOutlet var Start: UILabel!
    
    func animateLable(){
        UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveEaseOut, animations: {
            self.Start.alpha = 0.0
        }, completion: {
            finished in
            
            if finished {
                //Once the label is completely invisible, set the text and fade it back in
                self.Start.text = "Touch Anywhere To Begin"
                
                // Fade in
                UIView.animate(withDuration: 3.0, delay: 0.0, options: [.curveEaseIn,.repeat,.autoreverse], animations: {
                    self.Start.alpha = 1.0
                }, completion: nil)
            }
        })
    }
    
    func ball(){
        let ball = UIView()
        ball.backgroundColor = UIColor.black
        ball.frame = CGRect(x: 0, y: 350, width: 75, height: 75)
//        ball.layer.cornerRadius = 200
        self.view.addSubview(ball)
        UIView.animate(withDuration: 6, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 10, options: [UIViewAnimationOptions.repeat,UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse], animations: {
            ball.frame = CGRect(x: 120, y:300, width: 150, height:150)
        }, completion: nil)
    
    }
    
    func ball2(){
        let ball2 = UIView()
        ball2.backgroundColor = UIColor.black
        ball2.frame = CGRect(x: 350, y: 270, width: 100, height: 100)
//        ball2.layer.cornerRadius = 200
        self.view.addSubview(ball2)
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 5, options: [UIViewAnimationOptions.repeat,UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse], animations: {
            ball2.frame = CGRect(x: 120, y:300, width: 150, height:150)
        }, completion: nil)
    }
    func square(){
        let square = UIView()
        square.backgroundColor = UIColor.gray
        square.frame = CGRect(x: 20, y: 20, width: 75, height: 75)
        self.view.addSubview(square)
        UIView.animate(withDuration: 3, delay: 0,  usingSpringWithDamping: 10, initialSpringVelocity: 5,options: [UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse,UIViewAnimationOptions.repeat], animations:{
            square.backgroundColor = UIColor.orange
            square.frame = CGRect(x: 120, y: 300, width: 150, height: 150)}, completion: nil)
    }
    func square2(){
        let square2 = UIView()
        square2.backgroundColor = UIColor.gray
        square2.frame = CGRect(x: 360, y: 20, width: 75, height: 75)
        self.view.addSubview(square2)
        UIView.animate(withDuration: 6, delay: 0,  usingSpringWithDamping: 10, initialSpringVelocity: 5,options: [UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse,UIViewAnimationOptions.repeat], animations:{
            square2.backgroundColor = UIColor.orange
            square2.frame = CGRect(x: 120, y: 300, width: 150, height: 150)}, completion: nil)
    }
    func square3(){
        let square2 = UIView()
        square2.backgroundColor = UIColor.gray
        square2.frame = CGRect(x: 140, y: 20, width: 75, height: 75)
        self.view.addSubview(square2)
        UIView.animate(withDuration: 4, delay: 0,  usingSpringWithDamping: 10, initialSpringVelocity: 5,options: [UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse,UIViewAnimationOptions.repeat], animations:{
            square2.backgroundColor = UIColor.orange
            square2.frame = CGRect(x: 120, y: 300, width: 150, height: 150)}, completion: nil)
    }
    func square4(){
        let square2 = UIView()
        square2.backgroundColor = UIColor.gray
        square2.frame = CGRect(x: 140, y: 20, width: 75, height: 75)
        self.view.addSubview(square2)
        UIView.animate(withDuration: 5, delay: 0,  usingSpringWithDamping: 10, initialSpringVelocity: 5,options: [UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse,UIViewAnimationOptions.repeat], animations:{
            square2.backgroundColor = UIColor.orange
            square2.frame = CGRect(x: 120, y: 300, width: 150, height: 150)}, completion: nil)
    
    }
    
    func spin(){
        
        let square5 = UIView()
        
        UIView.animate(withDuration: 5, delay: 0,  usingSpringWithDamping: 10, initialSpringVelocity: 5,options: [UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse,UIViewAnimationOptions.repeat,UIViewAnimationOptions.allowAnimatedContent], animations:{
            square5.frame = CGRect(x: 120, y: 150, width: 150, height: 150)}, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    animateLable()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        ball()
        ball2()
        square()
        square2()
        square3()
        square4()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
