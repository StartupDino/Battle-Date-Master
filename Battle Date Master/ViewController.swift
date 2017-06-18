//
//  ViewController.swift
//  Battle Date Master
//
//  Created by Pete McPherson on 6/14/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import UIKit

//TODO: update the splash sceen sizes in illustrator
//TODO: 4 random battle generation is done. Time to update the label texts for "start round", and write button action to move the things around.



class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var nextRoundButton: UIButton!
    @IBOutlet weak var shakeButton: UIButton!


    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showWelcomeScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // sets up an initial welcome screen!
    
    func showWelcomeScreen() {
        label1.text = "Ready to"
        label2.text = "put these"
        label3.text = "historic battles"
        label4.text = "in order??"
        nextRoundButton.setTitle("Start the Round", for: UIControlState.normal)
        nextRoundButton.setImage(nil, for: UIControlState.normal)
        timerLabel.isHidden = true
        shakeButton.isHidden = true
    }
    
    // Starts a game of 6 rounds
    
    @IBAction func startRound() {
        chooseBattlesForRound()
        
        label1.text = roundBattles[0].description
        label2.text = roundBattles[1].description
        label3.text = roundBattles[2].description
        label4.text = roundBattles[3].description
        
        nextRoundButton.isHidden = true
        timerLabel.isHidden = false
    }

}

