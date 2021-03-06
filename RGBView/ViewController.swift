//
//  ViewController.swift
//  RGBView
//
//  Created by user on 15.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // colorView.backgroundColor = view.backgroundColor
        colorView.layer.cornerRadius = 10
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = 1
        
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = 1
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = 1
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
      
        setColor()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
    }

    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
                

        switch sender {
        case redSlider: setValue(for: redValueLabel)
        case greenSlider: setValue(for: greenValueLabel)
        default: setValue(for: blueValueLabel)
        }
        
    }
    
    
    @IBAction func redSliderAction() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
    }
    
    @IBAction func blueSliderAction() {
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
}

private func string(from slider: UISlider) -> String {
    String(format: "%.2f", slider.value)
}

extension ViewController {
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                label.text = string(from: redSlider)
            case greenValueLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
}
