//
//  RecordSoundsViewController.swift
//  Pitch Perfect 2.0
//
//  Created by frumschaft on 3/18/16.
//  Copyright © 2016 Frumschaft. All rights reserved.
//

import UIKit
import AVFoundation



class RecordSoundsViewController: UIViewController , AVAudioRecorderDelegate                            { // ### VIEW ###

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad()                                                                         { //
        super.viewDidLoad()
        // Do any additional setup after loading
        // the view, typically from a nib.
                                                                                                        } //
    
    override func viewDidLayoutSubviews()                                                               { // Thanks to Rob Mayoff stackoverflow.com/questions/17258084/
        super.viewDidLayoutSubviews()                                                                     // for this function,
        let topColor = UIColor(red: (15/255.0), green: (118/255.0), blue: (128/255.0), alpha: 1)
        let bottomColor = UIColor(red: (84/255.0), green: (187/255.0), blue: (187/255.0), alpha: 1)
        let layer = CAGradientLayer()                                                                     // and Paul Hudson for this simple gradient code.
        layer.frame = self.view.frame                                                                     // hackingwithswift.com/example-code/calayer/how-to-draw-color-gradients-using-cagradientlayer
        layer.colors = [topColor.CGColor, bottomColor.CGColor]
        view.layer.insertSublayer(layer, atIndex: 0)
                                                                                                        } //
    
    override func didReceiveMemoryWarning()                                                             { //
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
                                                                                                        } //
    
    @IBAction func recordAudio(sender: AnyObject)                                                       { //
        print("recordButton pushed.")
        recordingLabel.text = "Recording in progress …"
        stopRecordingButton.enabled = true
        recordButton.enabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        
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
    
    @IBAction func stopRecording(sender: AnyObject)                                                     { //
        print("stopRecordingButton pushed.")
        recordButton.enabled = true
        stopRecordingButton.enabled = false
        recordingLabel.text = "Tap to Record"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
                                                                                                        } //
    
    override func viewWillAppear(animated: Bool)                                                        { //
        stopRecordingButton.enabled = false
                                                                                                        } //
    // called by system when recording is stopped
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool)            { //
        print("Audio recording finished.")
        if (flag) {
            self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        } else {
            print("Saving of audio failed") }
                                                                                                        } //
    // transition to play sounds screen only after recording is successfully saved
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)                         { //
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destinationViewController as!
                PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL }
                                                                                                        } //
    
// end of UIViewController
                                                                                                        } // #### VIEW ####

