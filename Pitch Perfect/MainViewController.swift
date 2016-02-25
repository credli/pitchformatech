//
//  MainViewController.swift
//  Pitch Perfect
//
//  Created by Nicholas Credli on 1/28/16.
//  Copyright © 2016 Novium Collective SARL. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var recordButton: UIButton!
    var currentState: MainScreenState = .Stopped

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.recordButton.setTitle("Record", forState: .Normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Record"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startRecording(sender: UIButton) {
        toggleState()
    }
    
    // this is our state logic
    func toggleState() {
        switch self.currentState {
        case .Recording:
            setStateStopped()
        case .Stopped:
            setStateRecording()
        }
    }
    
    // this sets to recording
    func setStateRecording() {
        self.currentState = .Recording
        self.recordButton?.setTitle("Recording", forState: .Normal)
    }
    
    // this sets to stopped
    func setStateStopped() {
        self.currentState = .Stopped
        self.recordButton?.setTitle("Stopped", forState: .Normal)
        
        self.performSegueWithIdentifier("playbackSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "playbackSegue" {
            let playbackVC = segue.destinationViewController as! PlaybackViewController
            playbackVC.currentDate = NSDate()
        }
    }

}
