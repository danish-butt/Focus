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
        ball.frame = CGRect(x: 0, y: 270, width: 150, height: 150)
        ball.layer.cornerRadius = 140
        self.view.addSubview(ball)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    animateLable()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        ball()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
