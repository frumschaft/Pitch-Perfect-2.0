//
//  PlaySoundsViewController.swift
//  Pitch Perfect 2.0
//
//  Created by frumschaft on 3/19/16.
//  Copyright © 2016 Frumschaft. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController                                    { // ### VIEW ###
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var darthVaderButton: UIButton!
    @IBOutlet weak var parrotButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func playSoundForButton(sender: UIButton)                             { //
        print("Play sound button pressed")
                                                                                    } //
    @IBAction func stopButtonPressed(sender: UIButton)                              { //
        print("Stop audio button pressed")
                                                                                    } //
    var recordedAudio: NSURL!
    
    override func viewDidLoad()                                                     { //
        super.viewDidLoad()
        print("PlaySoundsViewController loaded")
        // Do any additional setup after loading the view.
                                                                                    } //
    override func didReceiveMemoryWarning()                                         { //
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
                                                                                    } //
                                                                                    } // ### VIEW ###
