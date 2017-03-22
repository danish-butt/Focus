//
//  ViewController.swift
//  Focus
//
//  Created by Michael Danylchuk on 2/28/17.
//  Copyright © 2017 Group. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController{
    
    var newListItem : ActivityMO!
    
//AVAudioPlayerDelegate
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
    
//    var player = AVAudioPlayer()
    func clickedSave() {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            newListItem = ActivityMO(context: appDelegate.persistentContainer.viewContext)
            
            newListItem.activityName = nameTextField.text
            newListItem.activityTime = Time.text
            newListItem.activityCompletion = true
            
            appDelegate.saveContext()
            nameTextField.text = ""
            
        }
    }
        
        func clickedDismiss() {
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                newListItem = ActivityMO(context: appDelegate.persistentContainer.viewContext)
                
                newListItem.activityName = nameTextField.text
                newListItem.activityTime = Time.text
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
        self.present(alertController, animated: true, completion: nil)
        nameTextField.isHidden = false
        timer.isHidden = false
        Start.isHidden = false
        Time.isHidden = true
        not.isHidden = false
        dis2.isHidden = false
        dis1.text = "Write The Task And Hit Start To Start Timer"
//        player.stop()
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        
     t = Timer.scheduledTimer(timeInterval: 1 , target: self, selector: #selector(ViewController.count), userInfo: nil, repeats: true)
        t.fire()

        nameTextField.isHidden = true
//        timer.datePickerMode = .countDownTimer
        timer.isHidden = true
        Start.isHidden = true
        Time.isHidden = false
        not.isHidden = true
        dis2.isHidden = true
        dis1.text = "When Timer Is Done, Tap It To Stop"
//        player.play()
    }
    
    
    func count(){

        timer.countDownDuration -= 1
        
        let minute = Int(((timer.countDownDuration/60.0)).rounded())
         let hour = Int((((timer.countDownDuration/60.0)/60.0)).rounded())
        let minute2 = Int(minute - (hour * 60))
       
        
         if minute >= 120{
                Time.text = String(hour) + " Hours " + String(minute2) + " Minutes "
        }
         else if minute >= 60 && minute < 120 {
                Time.text = String(hour) + " Hour " + String(minute2) + " Minutes"
        }
         else if minute == 1{
            Time.text = String( " Hours " + String(minute) + " Minute")
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
//        do {
//            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Rooster", ofType: "wav")!))
//            player.prepareToPlay()
//        }
//        catch{
//            print(error)
//        }

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

