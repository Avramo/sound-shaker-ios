//
//  ViewController.swift
//  Sound Shaker
//
//  Created by admin on 12/02/2020.
//  Copyright © 2020 AM Kirsch. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let sounds = ["boing", "tweet", "doorbell","plop", "drumroll", "rooster","guitar", "harp"]
    
    var player = AVAudioPlayer()

    @IBOutlet weak var soundLabel: UILabel!
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            play()
        }
    }
    
    func play(){
        let randomInt = Int.random(in: 0...7)
        
        let audioPath = Bundle.main.path(forResource: sounds[randomInt], ofType: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            player.play()
            
            soundLabel.text = "playing \(sounds[randomInt])"
            print("playing \(sounds[randomInt])")
            
        } catch  {
            print("AVPlayer Error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

