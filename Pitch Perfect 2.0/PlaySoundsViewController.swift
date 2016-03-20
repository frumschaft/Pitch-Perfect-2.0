//
//  PlaySoundsViewController.swift
//  Pitch Perfect 2.0
//
//  Created by Gavriel on 3/19/16.
//  Copyright © 2016 Frumschaft. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController                                                { // ### VIEW ###

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var darthVaderButton: UIButton!
    @IBOutlet weak var parrotButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func playSoundForButton(sender: UIButton)                                         { //
        print("play sound button pressed")
                                                                                                } //
    @IBAction func stopButtonPressed(sender: AnyObject)                                         { //
        print("stop audio button pressed")
                                                                                                } //
    
    var recordedAudio : NSURL!
    
    override func viewDidLoad()                                                                 { // ## 1 ##
        super.viewDidLoad()
        // Do any additional setup after loading
        // the view, typically from a nib.
    } // ## 1 ##
    
    override func didReceiveMemoryWarning()                                                     { // ## 2 ##
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // ## 2 ##
    


// end of UIViewController
                                                                                                } // #### VIEW ####

