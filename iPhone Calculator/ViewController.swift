//
//  ViewController.swift
//  iPhone Calculator
//
//  Created by Oleksandr Smakhtin on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var displayLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func culcBtnPressed(_ sender: UIButton) {
        print("culcButton pressed")
        if let act = sender.titleLabel?.text {
            if act == "AC" {
                displayLbl.text = "0"
            }
        }
    }
    
        
    @IBAction func numBtnPressed(_ sender: UIButton) {
        if let num = sender.titleLabel?.text {
            //displayLbl.text = ""
            
            displayLbl.text! += num
            if displayLbl.text?.first == "0" {
                displayLbl.text?.removeFirst()
            }
        }
    }
    

    

}

