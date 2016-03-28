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
    @IBOutlet weak var durationLabel: UILabel!
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    var duration: NSTimeInterval!
    
    
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, DarthVader, Parrot, Reverb }
    
    // attach audio modification to button
    @IBAction func playSoundForButton(sender: UIButton)                             { //
        print("Play sound button pressed")
        switch(ButtonType(rawValue: sender.tag)!)       { // switch on
        case .Slow:
            playSound(rate: 0.5)        // slows rate of playback to half speed with no change in pitch
        case .Fast:
            playSound(rate: 1.5)        // speeds up rate of playback to 1.5 times speed with no change in pitch
        case .Chipmunk:
            playSound(pitch: 1000)      // raises pitch of playback
        case .DarthVader:
            playSound(pitch: -1000)     // lowers pitch of playback
        case .Parrot:
            playSound(echo: true)       // echoes playback
        case .Reverb:
            playSound(reverb: true)     // applies reverberation to playback
                                                        } // switch off
        
        configureUI(.Playing)
                                                                                    } //
    @IBAction func stopButtonPressed(sender: UIButton)                              { //
        print("Stop audio button pressed")
        stopAudio()
                                                                                    } //
    override func viewDidLoad()                                                     { //
        super.viewDidLoad()
        setupAudio()
        durationLabel.text = String(duration)
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
