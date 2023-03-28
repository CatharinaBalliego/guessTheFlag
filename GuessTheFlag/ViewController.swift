//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Catharina Balliego on 27/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btn_option1: UIButton!
    @IBOutlet var btn_option2: UIButton!
    @IBOutlet var btn_option3: UIButton!
        
    var score = 0
    var countries = [String]()
    var correctAnswer = 0
    var row = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia","france","nigeria","uk","us","russia", "italy","spain", "germany","ireland","monaco","poland"]
        
        btn_option1.layer.borderWidth = 1
        btn_option2.layer.borderWidth = 1
        btn_option3.layer.borderWidth = 1
        
        btn_option1.layer.borderColor = UIColor.lightGray.cgColor
        btn_option2.layer.borderColor = UIColor.lightGray.cgColor
        btn_option3.layer.borderColor = UIColor.lightGray.cgColor
        
        //adjust image border to remove margin
        btn_option1.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        btn_option2.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        btn_option3.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        btn_option1.setImage(UIImage(named: countries[0]), for: .normal)
        btn_option2.setImage(UIImage(named: countries[1]), for: .normal)
        btn_option3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " Your score is \(score)"
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong \nThis is \(countries[sender.tag].uppercased())'s flag"
            score -= 1
        }
        
        row += 1
        
        var msg = "Your score is \(score) "
        
        if row == 9 {
            msg += " \nYou have one attempt left"
        }
        
        
        if row < 10 {
        let ac = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        }
        
        else {
            let ac = UIAlertController(title: "Congratulations!", message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Play again", style: .default, handler: askQuestion))
            score = 0
            row = 0
            present(ac, animated: true)
        }

    }
}

	
