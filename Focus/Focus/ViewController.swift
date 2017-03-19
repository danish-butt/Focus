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
    @IBOutlet var dis2: UILabel!
    @IBOutlet var dis1: UILabel!
    @IBOutlet var Start: UIButton!
    @IBOutlet var Time: UILabel!
    @IBOutlet var not: UILabel!
    var t = Timer()
    var timestring = ""
    var timerison = false
    

    
    
    @IBAction func tap(_ sender: Any) {
        t.invalidate()
        nameTextField.isHidden = false
        timer.isHidden = false
        Start.isHidden = false
        Time.isHidden = true
        not.isHidden = false
        dis2.isHidden = false
        dis1.isHidden = false
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        
     t = Timer.scheduledTimer(timeInterval: 60 , target: self, selector: #selector(ViewController.count), userInfo: nil, repeats: true)
        t.fire()
        if timer.countDownDuration == 0.0{
            
        }
        
        nameTextField.isHidden = true
        timer.isHidden = true
        Start.isHidden = true
        Time.isHidden = false
        not.isHidden = true
        dis2.isHidden = true
        dis1.isHidden = true
    }
    
    
    func count(){
        
         let minute = Int(((timer.countDownDuration/60.0)).rounded())
         let hour = Int((((timer.countDownDuration/60.0)/60.0)).rounded())
         timer.countDownDuration -= 1
        
         if minute >= 120{
            Time.text = String(hour) + " Hours"
        }
         else if minute >= 60 && minute < 120 {
            Time.text = String(hour) + " Hour"
        }
         else if minute == 1{
            Time.text = String(minute) + " Minute"
        }
         else{
            Time.text = String(minute) + " Minutes"
        }
        
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

