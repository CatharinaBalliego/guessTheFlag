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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia","france","nigeria","uk","us","russia", "italy","spain", "germany","ireland","monaco","poland"]
        
        btn_option1.layer.borderWidth = 1
        btn_option2.layer.borderWidth = 1
        btn_option3.layer.borderWidth = 1
        
        btn_option1.layer.borderColor = UIColor.lightGray.cgColor
        btn_option2.layer.borderColor = UIColor.lightGray.cgColor
        btn_option3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(){
        btn_option1.setImage(UIImage(named: countries[0]), for: .normal)
        btn_option2.setImage(UIImage(named: countries[1]), for: .normal)
        btn_option3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
}

	
