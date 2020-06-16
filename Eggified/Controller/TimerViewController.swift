//
//  ViewController.swift
//  Eggified
//
//  Created by Daniel Fischer on 13.06.20.
//  Copyright © 2020 Daniel Fischer. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var boilButton: UIButton!
    @IBOutlet weak var dontBoilButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStartUpConditions()
        
        
    }
    /**
     Determines the pressed button and set the timerLabel to the appropriate time. The function also enables the boilButton,
     so that the user coud start the timer.
     */
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            timerLabel.text = timeFormatted(300)
            boilButton.isEnabled = true
        case 2:
            timerLabel.text = timeFormatted(420)
            boilButton.isEnabled = true
        case 3:
            timerLabel.text = timeFormatted(600)
            boilButton.isEnabled = true
        default:
            timerLabel.text = "0"
        }
    }
    
    
    
    
    //MARK: - Setup And Format Functions
    
    /**
     Formats the given time in minutes and seconds.
     
     - Parameter totalSeconds: Via egg button selected time in seconds
     - Returns: A formated string for the timerLabel
     */
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    /**
     Sets properties for boil buttons and timeLabel.
     */
    func setStartUpConditions(){
        
        // Button configuration
        dontBoilButton.isHidden = true
        boilButton.isEnabled = false
        
        //label configuration
        timerLabel.adjustsFontSizeToFitWidth=true;
        timerLabel.text = "Select your egg"
    }
    
    
}

