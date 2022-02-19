//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTime = ["Soft" : 4, "Medium" : 5, "Hard" : 7]
    var player: AVAudioPlayer?
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 0.0
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        
        titleLabel.text = sender.currentTitle!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            secondsPassed += 1
            progressBar.progress  = Float(secondsPassed) / Float(totalTime)
        }else{
            timer.invalidate()
            playSound()
            titleLabel.text = "DONE!"
        }
    }
    
    func playSound() {
        let path = Bundle.main.path(forResource: "alarm_sound", ofType : "mp3")!
            let url = URL(fileURLWithPath : path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print ("There is an issue with this code!")
            }
    }
}
