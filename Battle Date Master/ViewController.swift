//
//  ViewController.swift
//  Battle Date Master
//
//  Created by Pete McPherson on 6/14/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import UIKit

var currentBattles = chooseBattlesForRound()
var whichView = "" // chooses which UIViewController subclass to pull up
var finalScore = "" // for displaying theh final score on ScoreController




class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var nextRoundButton: UIButton!
    @IBOutlet weak var shakeButton: UIButton!
    @IBOutlet weak var firstButtonDown: UIButton!
    @IBOutlet weak var secondButtonUp: UIButton!
    @IBOutlet weak var secondButtonDown: UIButton!
    @IBOutlet weak var thirdButtonUp: UIButton!
    @IBOutlet weak var thirdButtonDown: UIButton!
    @IBOutlet weak var fourthButtonUp: UIButton!
    
    // variables and constants used for gameplay
    
    let successImage = #imageLiteral(resourceName: "next_round_success")
    let failImage = #imageLiteral(resourceName: "next_round_fail")
    var questionsAsked = 0
    var score = 0
    
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
    
    func hideMoveButtons() {
        firstButtonDown.isHidden = true
        secondButtonUp.isHidden = true
        secondButtonDown.isHidden = true
        thirdButtonUp.isHidden = true
        thirdButtonDown.isHidden = true
        fourthButtonUp.isHidden = true
    }
    
    func showMoveButtons() {
        firstButtonDown.isHidden = false
        secondButtonUp.isHidden = false
        secondButtonDown.isHidden = false
        thirdButtonUp.isHidden = false
        thirdButtonDown.isHidden = false
        fourthButtonUp.isHidden = false
    }
    
    // adding functionality to up and down buttons
    
    @IBAction func firstBattleDown(_ sender: Any) {
        let temp = battle1
        battle1 = battle2
        battle2 = temp
        
        label1.text = battle1.description
        label2.text = battle2.description
    }
    
    @IBAction func secondBattleUp(_ sender: Any) {
        let temp = battle2
        battle2 = battle1
        battle1 = temp
        
        label1.text = battle1.description
        label2.text = battle2.description
    }
    
    @IBAction func secondBattleDown(_ sender: Any) {
        let temp = battle2
        battle2 = battle3
        battle3 = temp
        
        label2.text = battle2.description
        label3.text = battle3.description
        
    }
    
    @IBAction func thirdBattleUp(_ sender: Any) {
        let temp = battle3
        battle3 = battle2
        battle2 = temp
        
        label2.text = battle2.description
        label3.text = battle3.description
    }

    @IBAction func thirdBattleDown(_ sender: Any) {
        let temp = battle3
        battle3 = battle4
        battle4 = temp
        
        label3.text = battle3.description
        label4.text = battle4.description
    }
    
    @IBAction func fourthBattleUp(_ sender: Any) {
        let temp = battle4
        battle4 = battle3
        battle3 = temp
        
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
        
        hideMoveButtons()
        
    }
    
    // Starts a new round with 4 battles, OR displays score screen
    
    
    @IBAction func startRound(_ sender: Any) {
        
        showMoveButtons()
        
        if questionsAsked == 6 {
            //TODO: add logic for score screen
            questionsAsked = 0
            whichView = "scoreboard"
            finalScore = "\(score) out of 6"
            
            self.performSegue(withIdentifier: "gameOverSegue", sender: sender)
            
            
        } else {
            currentBattles = chooseBattlesForRound()
            battle1 = currentBattles[0]
            battle2 = currentBattles[1]
            battle3 = currentBattles[2]
            battle4 = currentBattles[3]
            
            setLabelText()
            shakeButton.setTitle("Shake your phone to submit!", for: UIControlState.normal)
            print(currentBattles)
            
            
            startTimer()
            questionsAsked += 1
        }
        
        nextRoundButton.isHidden = true
        timerLabel.isHidden = false
        shakeButton.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if whichView == "scoreboard" {
            let scoreView = segue.destination as! ScoreController
            scoreView.text = finalScore
        }
    }
    
    
    // shaking the device checks the battle order, and resets battles for next round.
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            
            timer.invalidate()
            seconds = 60
            timerLabel.text = String(seconds)
            
            if checkAnswer() == true {
                print("correct")
                nextRoundButton.setImage(successImage, for: UIControlState.normal)
                shakeButton.setTitle("Correct! Click each battle for info!", for: UIControlState.normal)
                score += 1
            } else {
                print("nope")
                nextRoundButton.setImage(failImage, for: UIControlState.normal)
                shakeButton.setTitle("Negative. Click each battle for info!", for: UIControlState.normal)
            }
            
            print(questionsAsked)
            nextRoundButton.isHidden = false
            timerLabel.isHidden = true
        }
    }
    
    func checkAnswer() -> Bool {
        if battle1.year <= battle2.year && battle2.year <= battle3.year && battle3.year <= battle4.year {
            return true
        } else {
            return false
        }
    }
    
    var timer = Timer()
    var seconds = 60
    
    func countdown() {
        if seconds > 0 {
            seconds -= 1
            timerLabel.text = String(seconds)
        } else {
            timer.invalidate()
            seconds = 60
            timerLabel.text = String(seconds)
            
            if checkAnswer() == true {
                print("correct")
                nextRoundButton.setImage(successImage, for: UIControlState.normal)
                shakeButton.setTitle("Correct! Click each battle for info!", for: UIControlState.normal)
                score += 1
            } else {
                print("nope")
                nextRoundButton.setImage(failImage, for: UIControlState.normal)
                shakeButton.setTitle("Negative. Click each battle for info!", for: UIControlState.normal)
            }
            
            print(questionsAsked)
            nextRoundButton.isHidden = false
            timerLabel.isHidden = true
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.countdown)), userInfo: nil, repeats: true)
    }
}

