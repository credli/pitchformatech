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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
