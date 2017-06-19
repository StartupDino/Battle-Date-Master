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
//TODO: implement apple icon


var currentBattles = chooseBattlesForRound()


class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var nextRoundButton: UIButton!
    @IBOutlet weak var shakeButton: UIButton!
    
    // variables and constants used for gameplay
    
    let successImage = #imageLiteral(resourceName: "next_round_success")
    let failImage = #imageLiteral(resourceName: "next_round_fail")
    var questionsAsked = 0
    
    var battle1 = currentBattles[0]
    var battle2 = currentBattles[1]
    var battle3 = currentBattles[2]
    var battle4 = currentBattles[3]
    
    func setLabelText() {
        label1.text = battle1.description
        label2.text = battle2.description
        label3.text = battle3.description
        label4.text = battle4.description
    }
    
    

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
        timerLabel.isHidden = true
        shakeButton.isHidden = true
    }
    
    // Starts a game of 6 rounds
    
    @IBAction func startRound() {
        
        if questionsAsked == 6 {
            //TODO: add logic for score screen
            questionsAsked = 0
        } else {
            currentBattles = chooseBattlesForRound()
            battle1 = currentBattles[0]
            battle2 = currentBattles[1]
            battle3 = currentBattles[2]
            battle4 = currentBattles[3]
            
            setLabelText()
            print(currentBattles)


            
            
            questionsAsked += 1
        }
        
        
        
        nextRoundButton.isHidden = true
        timerLabel.isHidden = false
        shakeButton.isHidden = false
    }
    
    // shaking the device checks the battle order, and resets battles for next round.
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            shakeButton.setTitle("maybe!!", for: UIControlState.normal)
            
            print(questionsAsked)
            nextRoundButton.isHidden = false
            nextRoundButton.setImage(successImage, for: UIControlState.normal)
        }
    }
    
    func checkAnswer() {
        //TODO: add logic, probably just if statement?
    }

}

