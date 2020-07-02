//
//  ViewController.swift
//  Eggified
//
//  Created by Daniel Fischer on 13.06.20.
//  Copyright © 2020 Daniel Fischer. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var boilTime: Int = 0
    var showBoilButtonImage : Bool = true
    
    var timer = Timer()
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var boilButton: UIButton!
    //@IBOutlet weak var dontBoilButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStartUpConditions()
        
        
    }
    /**
     Determines the pressed button and set the timerLabel to the appropriate time. The function also enables the boilButton,
     so that the user coud start the timer.
     */
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        
        boilButton.isEnabled = true
        
        switch sender.tag {
        case 1:
            timerLabel.text = timeFormatted(300)
            //TODO: Undo test time and set the correct boil time! 
            boilTime = 4
            
        case 2:
            timerLabel.text = timeFormatted(420)
            boilTime = 420
            
        case 3:
            timerLabel.text = timeFormatted(720)
            boilTime = 600
            
        default:
            timerLabel.text = "Select your egg"
        }
    }
    
    /**
     Toggles boil button image and calls startTimer() function.
     */
    @IBAction func boilButtonPressed(_ sender: UIButton) {
        
        // After the button was pressed, toggle image to show the dontBoil image, vice versa
        if showBoilButtonImage {
            if let buttonImage = UIImage(named: "dontBoil.pdf") {
                boilButton.setImage(buttonImage, for: .normal)
            }
            showBoilButtonImage.toggle()
            startTimer()
            
        } else {
            if let buttonImage = UIImage(named: "boil.pdf") {
                boilButton.setImage(buttonImage, for: .normal)
            }
            showBoilButtonImage.toggle()
            startTimer()
        }
    }
    
    
    
    /**
     Starts a timer, with an egg consistency specific time, which the user choose before.
     When the timer fires, an alarm sound is played and the view will lead to the Finished View Controller Scene.
     */
    func startTimer(){
        
        // If timer is already active, pause it!
        if timer.isValid {
            timer.invalidate()
            
        } else {    //
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                
                if self.boilTime > 0 {
                    self.boilTime -= 1
                    self.timerLabel.text = self.timeFormatted(self.boilTime)
                }
                if self.boilTime == 0 {
                    Timer.invalidate()
                    
                    //TODO: Play alarm sound
                    
                    self.performSegue(withIdentifier: "goToFinished", sender: self)
                    //print("Restzeit: \(self.boilTime)")
                }
            }
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
        boilButton.isEnabled = false
        
        
        //label configuration
        timerLabel.adjustsFontSizeToFitWidth=true;
        timerLabel.text = "Select your egg"
    }
    
    
}

