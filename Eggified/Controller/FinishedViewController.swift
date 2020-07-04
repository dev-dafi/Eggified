//
//  FinishedViewController.swift
//  Eggified
//
//  Created by Daniel Fischer on 15.06.20.
//  Copyright © 2020 Daniel Fischer. All rights reserved.
//

import UIKit
import AVFoundation
import Canvas

class FinishedViewController: UIViewController {
    
    @IBOutlet weak var animationView: CSAnimationView!
    @IBOutlet weak var dismissButton: UIButton!
    
    var player: AVAudioPlayer!
    var timer = Timer()
    var animationCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setButtonLayout()
        playSound(with: "alarmBell")
        startAnimation()
    }
    
    /**
     Starts a timer which fires every second for 10 seconds and trigger an animation of the AnimationView
     */
    func startAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.animationView.startCanvasAnimation()
            self.animationCount += 1
            
            if self.animationCount == 10 {
                self.timer.invalidate()
            }
        }
    }
    
    /**
     Stops the alarm sound, the timer and dismisses the view
     - Parameter sender: Information about pressed button
     */
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        player.stop()
        timer.invalidate()
        dismiss(animated: true, completion: nil)
    }
    
    /**
     Creates a soundURL and plays the given sound file
     - Parameter soundName: Name of the sound file which will be played with extension
     */
    func playSound(with soundName: String) {
        let soundURL = Bundle.main.url(forResource: soundName, withExtension: ".mp3")
        player = try! AVAudioPlayer(contentsOf: soundURL!)
        player.numberOfLoops = -1 // for sound loop
        player.play()
    }
    
    //MARK: - Styling
    
    /**
     Creates a button frame and styles it suitable
     */
    func setButtonLayout () {
        dismissButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        dismissButton.layer.borderWidth = 1
        dismissButton.layer.borderColor = CGColor(srgbRed: 240/255, green: 123/255, blue: 0, alpha: 1)
        dismissButton.layer.cornerRadius = 15
        
    }
}
