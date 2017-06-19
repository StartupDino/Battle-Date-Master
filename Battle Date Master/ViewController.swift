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
        
        
        let battle1 = roundBattles[0].description
        let battle2 = roundBattles[1].description
        let battle3 = roundBattles[2].description
        let battle4 = roundBattles[3].description
        
        label1.text = battle1
        label2.text = battle2
        label3.text = battle3
        label4.text = battle4
        
        print(battleIndex)
        print(roundBattles)
        
//        nextRoundButton.isHidden = true
//        timerLabel.isHidden = false
    }

}

