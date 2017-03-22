//
//  AnimationViewController.swift
//  Focus
//
//  Created by Michael Danylchuk on 3/18/17.
//  Copyright © 2017 Group. All rights reserved.
//
// Animations done by MICHAEL DANYLCHUK

import UIKit
//import AudioToolbox
//import AVFoundation

class AnimationViewController: UIViewController{
    //AVAudioPlayerDelegate
    
    @IBOutlet var Start: UILabel!
    @IBOutlet var welcometofocus: UILabel!
    @IBOutlet var animationsubview: UIView!
//    var audioPlayer = AVAudioPlayer()
    
    
    
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
    func animateLable2(){
        self.welcometofocus.alpha = 0
                self.welcometofocus.rotate360Degrees(duration: 1, completionDelegate: nil)
            UIView.animate(withDuration: 2, delay: 0.0, options:  [.curveEaseIn], animations: {
            self.welcometofocus.alpha = 1.0
        }, completion: nil)
    }
    func drawclock(){
        animationsubview.frame = CGRect(x:115, y:270, width: 195, height: 180)
        animationsubview.backgroundColor = UIColor(patternImage: UIImage(named: "Arrow")!)
        animationsubview.rotateclock(duration: 30, completionDelegate: nil)
    }
    

    func ball(){
        let ball = UIView()
        ball.backgroundColor = UIColor.red
        ball.frame = CGRect(x: 320, y: 640, width: 85, height: 85)
        self.view.addSubview(ball)
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 10, options: [UIViewAnimationOptions.repeat,UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse], animations: {
            ball.backgroundColor = UIColor.black
            ball.frame = CGRect(x: 160, y:640, width: 85, height: 85)
        }, completion: nil)
    
    }
    
    func ball2(){
        let ball2 = UIView()
        ball2.backgroundColor = UIColor.red
        ball2.frame = CGRect(x: 0, y: 640, width: 85, height: 85)
        self.view.addSubview(ball2)
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 10, options: [UIViewAnimationOptions.repeat,UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse], animations: {
            ball2.backgroundColor = UIColor.black
            ball2.frame = CGRect(x: 160, y:640, width: 85, height: 85)
        }, completion: nil)
    }
    
    func ball3(){
        let ball3 = UIView()
        ball3.backgroundColor = UIColor.red
        ball3.frame = CGRect(x: 320, y: 20, width: 85, height: 85)
        self.view.addSubview(ball3)
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 10, options: [UIViewAnimationOptions.repeat,UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse], animations: {
            ball3.backgroundColor = UIColor.black
            ball3.frame = CGRect(x: 160, y:20, width: 85, height: 85)
        }, completion: nil)
        
    }
    
    func ball4(){
        let ball4 = UIView()
        ball4.backgroundColor = UIColor.red
        ball4.frame = CGRect(x: 0, y: 20, width: 85, height: 85)
        self.view.addSubview(ball4)
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 10, options: [UIViewAnimationOptions.repeat,UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse], animations: {
            ball4.backgroundColor = UIColor.black
            ball4.frame = CGRect(x: 160, y:20, width: 85, height: 85)
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    animateLable()
    animateLable2()
//          do {
//            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Rooster", ofType: "mp3")!))
//            audioPlayer.play()
//        }
//        catch{
//            print(error)
//        }
    }
    override func viewDidAppear(_ animated: Bool) {
        ball()
        ball2()
        ball3()
        ball4()
        drawclock()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
