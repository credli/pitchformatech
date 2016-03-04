//
//  MainViewController.swift
//  Pitch Perfect
//
//  Created by Nicholas Credli on 1/28/16.
//  Copyright © 2016 Novium Collective SARL. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    //step 1: include AVFoundation library from the project settings screen
    
    //step 2: create an Audio recorder variable which will allow us to record / stop an audio
    var audioRecoder: AVAudioRecorder!
    
    @IBOutlet var recordButton: UIButton!
    var currentState: MainScreenState = .Stopped

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.recordButton.setTitle("Record", forState: .Normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Record"
        
        //step 3: initialize our audio recorder
        let audioSession: AVAudioSession = AVAudioSession.sharedInstance()
        
        //step 4: check if we have permissions to use the audio
        if(audioSession.respondsToSelector("requestRecordPermission:")) {
            audioSession.requestRecordPermission() { (granted: Bool)->Void in
                if(granted) {
                    //set category and activate recorder session
                    try! audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
                    try! audioSession.setActive(true)
                } else {
                    //show alert if permission failed
                    let alertViewController = UIAlertController(title: "Something is wrong", message: "You have not granted us permission to access your microphone", preferredStyle: UIAlertControllerStyle.Alert)
                    self.presentViewController(alertViewController, animated: true, completion: nil)
                }
            }
        }
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
        
        //step 5: initialize the audio recorder if it wasn't already initialized
        if self.audioRecoder == nil {
            let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
            let fullPath = documentsDirectory.stringByAppendingString("/voiceRecording.caf")
            print(fullPath)
            let url = NSURL.fileURLWithPath(fullPath)
            
            //create AnyObject of settings
            let settings: [String : AnyObject] = [
                AVFormatIDKey:Int(kAudioFormatAppleIMA4), //Int required in Swift2
                AVSampleRateKey:44100.0,
                AVNumberOfChannelsKey:2,
                AVEncoderBitRateKey:12800,
                AVLinearPCMBitDepthKey:16,
                AVEncoderAudioQualityKey:AVAudioQuality.Max.rawValue
            ]
            
            try! self.audioRecoder = AVAudioRecorder(URL: url, settings: settings)
        }
        
        //step 6: start recording
        self.audioRecoder.record()
        
        self.currentState = .Recording
        self.recordButton?.setTitle("Recording", forState: .Normal)
    }
    
    // this sets to stopped
    func setStateStopped() {
        
        //step 7: when we're done, we stop recording
        self.audioRecoder.stop()
        
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
