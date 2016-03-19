//
//  ViewController.swift
//  Pitch Perfect 2.0
//
//  Created by Gavriel on 3/18/16.
//  Copyright © 2016 Frumschaft. All rights reserved.
//

import UIKit

class ViewController: UIViewController  { // #### VIEW ####

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad()                                 { // ## 1 ##
        super.viewDidLoad()
        // Do any additional setup after loading
        // the view, typically from a nib.
                                                                } // ## 1 ##

    override func didReceiveMemoryWarning()                     { // ## 2 ##
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
                                                                } // ## 2 ##

    @IBAction func recordAudio(sender: AnyObject)               { //
        print("That tickles!")
        recordingLabel.text = "Recording in progress …"
        stopRecordingButton.enabled = true
        recordButton.enabled = false
                                                                } //

    @IBAction func stopRecording(sender: AnyObject)             { //
        print("Thanks!")
        recordButton.enabled = true
        stopRecordingButton.enabled = false
        recordingLabel.text = "Tap to Record"
                                                                } //
    override func viewWillAppear(animated: Bool)                { //
        stopRecordingButton.enabled = false
                                                                } //
    
    // end of UIViewController
                                        } // #### VIEW ####

