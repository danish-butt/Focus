//
//  ViewController.swift
//  Focus
//
//  Created by Michael Danylchuk on 2/28/17.
//  Copyright © 2017 Group. All rights reserved.
//

// Timer and other code on this page (MICHAEL DANYLCHUK)
// Design aspect of page (SOUMYA SAXENA)

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var newListItem : ActivityMO!
    
//    var player2 : AVAudioPlayer!
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
    
    func clickedSave() {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            newListItem = ActivityMO(context: appDelegate.persistentContainer.viewContext)
            
            newListItem.activityName = nameTextField.text
            newListItem.activityTime = Time.text!
            newListItem.activityCompletion = true
            
            appDelegate.saveContext()
            nameTextField.text = ""
            
        }
    }
        
        func clickedDismiss() {
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                newListItem = ActivityMO(context: appDelegate.persistentContainer.viewContext)
                
                newListItem.activityName = nameTextField.text
                newListItem.activityTime = Time.text!
                newListItem.activityCompletion = false
                
                appDelegate.saveContext()
                nameTextField.text = ""
                
            }
        
        }
    @IBAction func tap(_ sender: Any) {
        
        t.invalidate()
        let alertController = UIAlertController(title: nameTextField.text, message:
            "DONE!🎉", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "save", style: UIAlertActionStyle.default,handler: {(alert: UIAlertAction!) in self.clickedSave()}))
        alertController.addAction(UIAlertAction(title: "dismiss", style: UIAlertActionStyle.default,handler:{(alert: UIAlertAction!) in self.clickedDismiss()}))
//        if player2 != nil{
//            player2.stop()
//            player2 = nil
//        }
        self.present(alertController, animated: true, completion: nil)
        nameTextField.isHidden = false
        timer.isHidden = false
        Start.isHidden = false
        Time.isHidden = true
        not.isHidden = false
        dis2.isHidden = false
        dis1.text = "Write The Task And Hit Start To Start Timer"
        
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        
        timer.countDownDuration = timer.countDownDuration + 1
     t = Timer.scheduledTimer(timeInterval:60 , target: self, selector: #selector(ViewController.count), userInfo: nil, repeats: true)
        t.fire()
        if timer.countDownDuration == 1{
            t.invalidate()
            let alertController = UIAlertController(title: nameTextField.text, message:
                "DONE!🎉", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "save", style: UIAlertActionStyle.default,handler: {(alert: UIAlertAction!) in self.clickedSave()}))
            alertController.addAction(UIAlertAction(title: "dismiss", style: UIAlertActionStyle.default,handler:{(alert: UIAlertAction!) in self.clickedDismiss()}))
            self.present(alertController, animated: true, completion: nil)
            nameTextField.isHidden = false
            timer.isHidden = false
            Start.isHidden = false
            Time.isHidden = true
            not.isHidden = false
            dis2.isHidden = false
            dis1.text = "Write The Task And Hit Start To Start Timer"
        }
        nameTextField.isHidden = true
//        timer.datePickerMode = .countDownTimer
        timer.isHidden = true
        Start.isHidden = true
        Time.isHidden = false
        not.isHidden = true
        dis2.isHidden = true
        dis1.text = "When Timer Is Done, Tap It To Stop"
       
    }
    
    
    func count(){

        timer.countDownDuration -= 1
        
        let minute = Int((((timer.countDownDuration - 1)/60.0)).rounded())
         let hour = Int(((((timer.countDownDuration - 1)/60.0)/60.0)).rounded())
        let minute2 = Int(minute - (hour * 60))
       
        
         if minute >= 120{
                Time.text = String(hour) + " Hours " + String(minute2) + " Minutes "
        }
         else if minute >= 60 && minute < 120 {
                Time.text = String(hour) + " Hour " + String(minute2) + " Minutes"
        }
         else if minute == 1{
            Time.text = String( "0 Hours " + String(minute) + " Minute")
        }
         else if minute < 60{
            Time.text = "0" + " Hours " + String(minute) + " Minutes"
            
         }else if timer.countDownDuration == 0{
            t.invalidate()
            let alertController = UIAlertController(title: nameTextField.text, message:
                "DONE!🎉", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "save", style: UIAlertActionStyle.default,handler: {(alert: UIAlertAction!) in self.clickedSave()}))
            alertController.addAction(UIAlertAction(title: "dismiss", style: UIAlertActionStyle.default,handler:{(alert: UIAlertAction!) in self.clickedDismiss()}))
            self.present(alertController, animated: true, completion: nil)
        }
       }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        self.view.insertSubview(backgroundImage, at: 0)
          Time.isHidden = true
     timer.countDownDuration = (00)
//        let path = Bundle.main.path(forResource: "Tick.mp3", ofType: nil)!
//        let url = URL(fileURLWithPath: path)
//        do {
//            let sound = try AVAudioPlayer(contentsOf: url)
//            player2 = sound
//            sound.play()
//        }
//        catch{
//            print(error)
//        }

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

