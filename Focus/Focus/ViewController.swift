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
    var t = Timer()
    var minutes: Int = 0
    var seconds: Int = 0
    var fractions: Int = 0
    var hours: Int = 0
    var timestring = ""
    var timerison = false
    @IBOutlet var not: UILabel!
    
    @IBAction func tap(_ sender: Any) {
//        if timerison == false{
//            t = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        count()
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
        count()
        t.fire()
        
        nameTextField.isHidden = true
        timer.isHidden = true
        Start.isHidden = true
        Time.isHidden = false
        not.isHidden = true
    }
    
    func count(){
        t = Timer.scheduledTimer(timeInterval: timer.countDownDuration, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        Time.text = String(timer.countDownDuration)
    }
    
    func update(){
        
        fractions -= 1
        if fractions == 100{
            
            seconds -= 1
            fractions = 0
        }
        
        if seconds == 60{
            
            minutes -= 1
            seconds = 0
        }
        
        if minutes == 60{
            
            hours -= 1
            minutes = 0
        }
    
        let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        let hoursString = hours > 9 ? "\(hours)" : "0\(hours)"
        let timestring = "\(hoursString):\(minutesString):\(secondsString).\(fractionsString)"
        Time.text = timestring
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     Time.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

