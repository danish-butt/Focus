//
//  ProfileViewController.swift
//  Focus
//
//  Created by Jaydeep Singh on 3/15/17.
//  Copyright © 2017 Group. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController, NSFetchedResultsControllerDelegate {

    @IBOutlet var numCompleted: UILabel!
    @IBOutlet var calculatedSuccessRate: UILabel!
    @IBOutlet var numAttempted: UILabel!
    
    var myListObjects : [ActivityMO] = []
    var fetchResultsController : NSFetchedResultsController<ActivityMO>!
    
    var numTasksCompleted = 0
    var numTasksAttempted = 0
    var successRate = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        self.view.insertSubview(backgroundImage, at: 0)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let fetchRequest : NSFetchRequest<ActivityMO> = ActivityMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "activityName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultsController.delegate = self
            
            do {
                try fetchResultsController.performFetch()
                if let fetchedObjects = fetchResultsController.fetchedObjects {
                    myListObjects = fetchedObjects
                }
                
                
            } catch {
                print(error)
            }
        }
        
        numTasksCompleted = 0
        
        //Find out how many tasks were completed
        for item in myListObjects {
            if item.activityCompletion {
                numTasksCompleted += 1
            }
        }
        
        numTasksAttempted = myListObjects.count
        
        numCompleted.text = String(numTasksCompleted)
        numAttempted.text = String(numTasksAttempted)
        
        successRate = Double(numTasksCompleted) / Double(numTasksAttempted) * 100.0
        
        calculatedSuccessRate.text = String(successRate) + "%"
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
