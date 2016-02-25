//
//  PlaybackViewController.swift
//  Pitch Perfect
//
//  Created by Nicholas Credli on 2/23/16.
//  Copyright © 2016 Novium Collective SARL. All rights reserved.
//

import UIKit

class PlaybackViewController: UIViewController {
    
    var currentDate: NSDate?
    var dateFormatter: NSDateFormatter = NSDateFormatter()
    
    @IBOutlet weak var currentDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Playback"

        self.dateFormatter.dateFormat = "d-M-yyyy H:mm:ss"
        self.currentDateLabel.text = self.dateFormatter.stringFromDate(self.currentDate!)
        
        //self.navigationItem.setHidesBackButton(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
