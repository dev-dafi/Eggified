//
//  FinishedViewController.swift
//  Eggified
//
//  Created by Daniel Fischer on 15.06.20.
//  Copyright © 2020 Daniel Fischer. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setButtonLayout()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
