//
//  ProfileViewController.swift
//  Focus
//
//  Created by Jaydeep Singh on 3/15/17.
//  Copyright © 2017 Group. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var numTotalTasksCompleted: UILabel!
    @IBOutlet var averageTimeSpentOnATask: UILabel!
    @IBOutlet var averageNumTasksCompletedPerDay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        self.view.insertSubview(backgroundImage, at: 0)

        //Run a query to get total num of tasks completed
        
        //Run a query to get total time spent on tasks
        
        //Calculate the average time spent on a task
        
        //Run a query to get number of days app was used
        
        //Calculate average number of tasks completed
        
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
