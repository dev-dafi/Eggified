//
//  FinishedViewController.swift
//  Eggified
//
//  Created by Daniel Fischer on 15.06.20.
//  Copyright © 2020 Daniel Fischer. All rights reserved.
//

import UIKit
import AVFoundation

class FinishedViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var dismissButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setButtonLayout()
        playSound(with: "alarmBell")
        
    }
    
    /**
     Stops the alarm sound and dismisses view and show TimerViewControllerView
     - Parameter sender: Information about pressed button
     */
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        print(sender)
        player.stop()
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
