//
//  ViewController.swift
//  Project2
//
//  Created by Débora Lage on 21/05/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "us", "uk"]
        setupUI()
        askQuestion()
    }
    
    func setupUI() {
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        questionsAsked += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) (score: \(score))"
    }
    
    func restart(action: UIAlertAction! = nil) {
        score = 0
        correctAnswer = 0
        questionsAsked = 0
    }
    
    func showWrongAnswerAlert() {
        var correctFlag: String
        if correctAnswer == 0 {
            correctFlag = "First"
        } else if correctAnswer == 1 {
            correctFlag = "Second"
        } else {
            correctFlag = "Third"
        }
        let ac = UIAlertController(title: "Wrong flag", message: "\(correctFlag) flag was the correct one", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .destructive))
        present(ac, animated: true)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
            showWrongAnswerAlert()
        }
        askQuestion()
        
        if questionsAsked == 10 {
            let ac = UIAlertController(title: "Game Over", message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: restart))
            present(ac, animated: true)
        }
    }
}
