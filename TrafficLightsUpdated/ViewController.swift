//
//  ViewController.swift
//  TrafficLightsUpdated
//
//  Created by Mark Papush on 3/22/23.
//

import UIKit

//enum Lights {
  //  case red, yellow, green
//}

final class ViewController: UIViewController {

    @IBOutlet var changeColorButton: UIButton!
    
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    @IBOutlet var redLight: UIView!
    
    private var currentColour = Lights.red
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        greenLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        redLight.alpha = lightIsOff
        
        greenLight.layer.cornerRadius = greenLight.frame.height / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.height / 2
        redLight.layer.cornerRadius = redLight.frame.height / 2
        
        changeColorButton.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }

    @IBAction func changeColour(_ sender: UIButton) {
        if changeColorButton.currentTitle == "Start" {
            changeColorButton.setTitle("Next", for: .normal)
        }
        switch currentColour {
            case .red:
                greenLight.alpha = lightIsOff
            
                redLight.alpha = lightIsOn
                currentColour = .yellow
            case .yellow:
                yellowLight.alpha = lightIsOn
                redLight.alpha = lightIsOff
                currentColour = .green
            case .green:
                greenLight.alpha = lightIsOn
                yellowLight.alpha = lightIsOff
                currentColour = .red
            }
    }
    
}

extension ViewController {
    private enum Lights {
        case red, yellow, green
    }
}

