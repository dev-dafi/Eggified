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
    
    // TEST VARIABLES
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var boilEggButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStartUpConditions()
    }
    
    /**
     Determines the pressed button and set the timerLabel to the appropriate time. The function also enables the boilButton,
     so that the user coud start the timer.
     */
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        
        boilEggButton.isEnabled = true
        
        switch sender.tag {
        case 1:
            timerLabel.text = timeFormatted(300)
            boilTime = 300
            
        case 2:
            timerLabel.text = timeFormatted(420)
            boilTime = 420
            
        case 3:
            timerLabel.text = timeFormatted(720)
            boilTime = 720
            
        default:
            timerLabel.text = "Select your egg"
        }
    }
    
    /**
     When the user presses the button, the image for the boiling button will toggle to an alternate button. If the user want
     to pause the timer, the button will change again and vice versa.
     - Parameter sender: Information about pressed button
     */
    @IBAction func boilEggButtonPressed(_ sender: UIButton) {
        
        // After the button was pressed, toggle image to show the dontBoil image, vice versa
        if showBoilButtonImage {
            boilEggButton.setImage(UIImage(named: "dontBoil.pdf"), for: .normal)
            showBoilButtonImage.toggle()
            startTimer()
            
        } else {
            boilEggButton.setImage(UIImage(named: "boil.pdf"), for: .normal)
            showBoilButtonImage.toggle()
            startTimer()
        }
    }

    /**
     Starts a timer, with an egg consistency specific time, which the user has choosen before.
     When the timer fires, the app is setup back to its startup condition and the view will lead to the Finished View Controller Scene.
     */
    func startTimer(){
        
        // If timer is already running and user clicks on boil button again, pause it!
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
                    
                    print("showBoilButtonImage \(self.showBoilButtonImage)")
                    self.setStartUpConditions()
                    self.performSegue(withIdentifier: "goToFinished", sender: self)
                    
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
     Sets startup conditions for buttons and labels
     */
    func setStartUpConditions(){
        
        // Button configuration
        boilEggButton.isEnabled = false
       
        if !showBoilButtonImage {
            showBoilButtonImage = true
            if let buttonImage = UIImage(named: "boil.pdf") {
                boilEggButton.setImage(buttonImage, for: .normal)
            }
        }
        
        //label configuration
        timerLabel.adjustsFontSizeToFitWidth=true;
        timerLabel.text = "Select your egg"
    }
    
    
}

