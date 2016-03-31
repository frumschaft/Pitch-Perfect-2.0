//
//  PlaySoundsViewController.swift
//  Pitch Perfect 2.0
//
//  Created by frumschaft on 3/19/16.
//  Copyright © 2016 Frumschaft. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
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
    
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, DarthVader, Parrot, Reverb }
    
    // attach audio modification to button
    @IBAction func playSoundForButton(sender: UIButton) {
        print("Play sound button pressed")
        switch(ButtonType(rawValue: sender.tag)!) {
        case .Slow:
            // slows rate of playback to half speed with no change in pitch
            playSound(rate: 0.5)
        case .Fast:
            // speeds up rate of playback to 1.5 times speed with no change in pitch
            playSound(rate: 1.5)
        case .Chipmunk:
            // raises pitch of playback
            playSound(pitch: 1000)
        case .DarthVader:
            // lowers pitch of playback
            playSound(pitch: -1000)
        case .Parrot:
            // echoes playback
            playSound(echo: true)
        case .Reverb:
            // applies reverberation to playback
            playSound(reverb: true)
        }
        configureUI(.Playing)
    }
    
    @IBAction func stopButtonPressed(sender: UIButton) {
        print("Stop audio button pressed")
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // These lines thanks to course mentor Shruti for helping me to figure out.
        let audioPlayer:AVAudioPlayer? = try? AVAudioPlayer(contentsOfURL: recordedAudioURL)
        if let player = audioPlayer {
            durationLabel.text = "Recording is " + String(format :"%.3f",  player.duration) + " seconds long."
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
