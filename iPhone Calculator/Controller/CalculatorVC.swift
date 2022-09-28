//
//  ViewController.swift
//  iPhone Calculator
//
//  Created by Oleksandr Smakhtin on 25.09.2022.
//

import UIKit
import AVFoundation

class CalculatorVC: UIViewController {

    
    
    @IBOutlet weak var displayLbl: UILabel!
    
    var audioPlayer = AVAudioPlayer()
    private var isFinishedTypingNumber = true
    private var displayValue: Double {
        // when we use it
        get {
            guard let number = Double(displayLbl.text!) else {fatalError("Can't conver displayLbl(String) into Double")}
            return number
        }
        set {
            let dbl = newValue
            let isInt = floor(dbl) == dbl
            if isInt {
                displayLbl.text = String(Int(dbl))
            } else {
                displayLbl.text = String(newValue)
            }
        }
    }
    private var calculator = CalculatorLogic()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func culcBtnPressed(_ sender: UIButton) {
        tapSound()
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        guard let sen = sender.titleLabel?.text else { return }
        if sen == "AC" || sen == "+/-" || sen == "%" {
            
            if let superView = sender.superview {
                superView.backgroundColor = #colorLiteral(red: 0.8470831513, green: 0.8470831513, blue: 0.8470831513, alpha: 1)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.13, execute: {
                if let superView = sender.superview {
                    superView.backgroundColor = #colorLiteral(red: 0.6470588446, green: 0.6470588446, blue: 0.6470588446, alpha: 1)
                }
            })
        } else {
            if let superView = sender.superview {
                superView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                sender.tintColor = #colorLiteral(red: 0.9978609681, green: 0.621840775, blue: 0.0255520381, alpha: 1)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.13, execute: {
                if let superView = sender.superview {
                    superView.backgroundColor = #colorLiteral(red: 0.9978609681, green: 0.621840775, blue: 0.0255520381, alpha: 1)
                    sender.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }
            })
        }
        
        
        
        
        
        if let calcMethod = sender.titleLabel?.text {
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
        
    }
    
    @IBAction func numBtnPressed(_ sender: UIButton) {
        tapSound()
        // touch view action
        if let superView = sender.superview {
            superView.backgroundColor = .gray
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.13, execute: {
            if let superView = sender.superview {
                superView.backgroundColor = #colorLiteral(red: 0.1951842308, green: 0.200163126, blue: 0.195766449, alpha: 1)
            }
        })
        
        if let numValue = sender.titleLabel?.text {
            
            if isFinishedTypingNumber {
                displayLbl.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLbl.text = displayLbl.text! + numValue
            }
        }
        
            
           
    }
    
    
//MARK: - AVPlayer
    func tapSound() {
        let pathToSound = Bundle.main.path(forResource: "tap", ofType: "mp3")!
        let url = URL(filePath: pathToSound)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("Audio error")
        }
    }
    


    

}

