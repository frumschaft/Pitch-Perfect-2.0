//
//  RecordSoundsViewController.swift
//  Pitch Perfect 2.0
//
//  Created by Gavriel on 3/18/16.
//  Copyright © 2016 Frumschaft. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController , AVAudioRecorderDelegate  { // #### VIEW ####

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad()                                                                 { // ## 1 ##
        super.viewDidLoad()
        // Do any additional setup after loading
        // the view, typically from a nib.
                                                                                                } // ## 1 ##
    
    override func didReceiveMemoryWarning()                                                     { // ## 2 ##
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
                                                                                                } // ## 2 ##
    
    @IBAction func recordAudio(sender: AnyObject)                                               { //
        print("That tickles!")
        recordingLabel.text = "Recording in progress …"
        stopRecordingButton.enabled = true
        recordButton.enabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory,.UserDomainMask, true)[0] as String
        
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
                                                                                                } //
    
    @IBAction func stopRecording(sender: AnyObject)                                             { //
        print("Thanks!")
        recordButton.enabled = true
        stopRecordingButton.enabled = false
        recordingLabel.text = "Tap to Record"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
                                                                                                } //
    
    override func viewWillAppear(animated: Bool)                                                { //
        stopRecordingButton.enabled = false
                                                                                                } //
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool)    { //
        print("Audio recording finished.")
        if (flag) {
            self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url) }
        else {
            print("Saving of audio failed") }
                                                                                                } //
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)                 { //
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destinationViewController as!
                PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            PlaySoundsVC.recordedAudio = recordedAudioURL}
                                                                                                } //
    
    // end of UIViewController
                                                    } // #### VIEW ####

