//
//  AnimationViewController.swift
//  Focus
//
//  Created by Michael Danylchuk on 3/18/17.
//  Copyright © 2017 Group. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    
    var lable = UIView()
    var Ispressed = false
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
//                    {
//                    finished in
//                    
//                    if finished {
//                        //Once the label is completely invisible, set the text and fade it back in
//                        self.Start.text = "Touch Anywhere To Begin"
//                        
//                        // Fade in
//                        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
//                            self.Start.alpha = 0.0
//                        }, completion: nil)
//                    }
//                })
            }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    animateLable()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}