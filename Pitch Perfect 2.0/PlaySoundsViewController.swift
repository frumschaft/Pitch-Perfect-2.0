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
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, DarthVader, Parrot, Reverb }
    
    @IBAction func playSoundForButton(sender: UIButton)                             { //
        print("Play sound button pressed")
        switch(ButtonType(rawValue: sender.tag)!)       { // switch on
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .DarthVader:
            playSound(pitch: -1000)
        case .Parrot:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)                     } // switch off
        
        configureUI(.Playing)
                                                                                    } //
    @IBAction func stopButtonPressed(sender: UIButton)                              { //
        print("Stop audio button pressed")
        stopAudio()

                                                                                    } //
    // var recordedAudio: NSURL!
    
    override func viewDidLoad()                                                     { //
        super.viewDidLoad()
        print("PlaySoundsViewController loaded")
        setupAudio()
        // Do any additional setup after loading the view.
                                                                                    } //
    override func viewDidAppear(animated: Bool)                                     { //
        configureUI(.NotPlaying)
                                                                                    } //
    override func didReceiveMemoryWarning()                                         { //
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
                                                                                    } //
                                                                                    } // ### VIEW ###
