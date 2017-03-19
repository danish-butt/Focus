//
//  ViewController.swift
//  Focus
//
//  Created by Michael Danylchuk on 2/28/17.
//  Copyright © 2017 Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timer: UIDatePicker!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet var Start: UIButton!
    @IBOutlet var Time: UILabel!
    @IBOutlet var not: UILabel!
    var t = Timer()
    var timestring = ""
    var timerison = false
    var minute = 0
    var hour = 0
    var seconds = 0
    
    
    @IBAction func tap(_ sender: Any) {
//        if timerison == false{
//            t = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
//        count()
           t.invalidate()
        
        nameTextField.isHidden = false
        timer.isHidden = false
        Start.isHidden = false
        Time.isHidden = true
        not.isHidden = false
//        }
//        if timerison == true{
//            t.invalidate()
//            timerison = false
//        }
//        
//        timerison = true
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        
     t = Timer.scheduledTimer(timeInterval: timer.countDownDuration, target: self, selector: #selector(ViewController.count), userInfo: nil, repeats: true)
        
        
        t.fire()
        
        nameTextField.isHidden = true
        timer.isHidden = true
        Start.isHidden = true
        Time.isHidden = false
        not.isHidden = true
    }
    
    
    func count(){
        
         seconds = Int((timer.countDownDuration/60.0).rounded())
         minute = Int(((timer.countDownDuration/60.0)/60).rounded())
         hour = Int((((timer.countDownDuration/60.0)/60.0)/60).rounded())
         timer.countDownDuration -= 1
        if seconds > 3600{
        Time.text = String(hour)
        }else if seconds > 60{
        Time.text = String(minute)
        }else{
        Time.text = String(seconds)
        }
       
    
//        Time.text = String(Int(timer.countDownDuration.rounded()))
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        self.view.insertSubview(backgroundImage, at: 0)
          Time.isHidden = true
     timer.countDownDuration = (00)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

