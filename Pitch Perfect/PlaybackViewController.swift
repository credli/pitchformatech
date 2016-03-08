//
//  PlaybackViewController.swift
//  Pitch Perfect
//
//  Created by Nicholas Credli on 2/23/16.
//  Copyright © 2016 Novium Collective SARL. All rights reserved.
//

import UIKit
import AVFoundation

class PlaybackViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var receivedRecordedFile: RecordingFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Playback"
        
        if let url = receivedRecordedFile.filePathURL {
            self.audioPlayer = try! AVAudioPlayer(contentsOfURL: url)
            self.audioPlayer.enableRate = true
        } else {
            print("filePathURL was nil")
        }
    }
    
    func playAtRate(var rate: Float) {
        if rate < 0.5 {
            rate = 0.5
        }
        if rate > 2.0 {
            rate = 2.0
        }
        
        //reset audioPlayer and play from the start
        audioPlayer.stop()
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        audioPlayer.updateMeters()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playFast() {
        playAtRate(1.5)
        print("playing fast")
    }
    
    @IBAction func playSlow() {
        playAtRate(0.5)
        print("playing slow")
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
