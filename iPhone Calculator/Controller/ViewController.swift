//
//  ViewController.swift
//  iPhone Calculator
//
//  Created by Oleksandr Smakhtin on 25.09.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    
    @IBOutlet weak var displayLbl: UILabel!
    
    var audioPlayer = AVAudioPlayer()
    private var isFinishedTypingNumber = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func culcBtnPressed(_ sender: UIButton) {
        print("culcButton pressed")
        isFinishedTypingNumber = true
        
        if let act = sender.titleLabel?.text {
            
            if act == "AC" {
                displayLbl.text = "0"
                
            }
            
            
            
            
            
        }
    }
    
    @IBAction func numBtnPressed(_ sender: UIButton) {
        if let num = sender.titleLabel?.text {
            
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
            
            
            if displayLbl.text?.count == 9 {
                return
            }
            
            
            
//            // set max char
//            if displayLbl.text?.count == 11 {
//                return
//            }
//            if displayLbl.text!.count >= 4 {
//                // make spacing
//                switch displayLbl.text?.count {
//                case 4:
//                    displayLbl.text?.insert(" ", at: displayLbl.text.index)
//                case 7:
//                    displayLbl.text?.append(" ")
//                case 2:
//                    displayLbl.text?.append(" ")
//                default:
//                    print("bruh")
//                }
//            }
            
            
            
            
            // print numbers
            if isFinishedTypingNumber {
                displayLbl.text = num
                isFinishedTypingNumber = false
            } else {
                displayLbl.text?.append(num)
            }
            
            
        }
    }
    
    
    
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

