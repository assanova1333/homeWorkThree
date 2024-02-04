//
//  ViewController.swift
//  homeWorkThree
//
//  Created by Aidana Assanova on 05.02.2024.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colorView: UIView!

    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSliders()
        setupCornerRadius()
    }
    
    private func setupSliders() {
    [redSlider, greenSlider, blueSlider].forEach {
        $0?.minimumValue = 0
        $0?.maximumValue = 1
        $0?.value = 0.5
        $0?.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
        updateColor()
    }
    
    private func setupCornerRadius() {
        colorView.layer.cornerRadius = 20
        colorView.layer.masksToBounds = true
       }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        updateColor()
        updateSliderValueLabels()
    }
    
    private func updateColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
            
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)

        redLabel.text = "Red:"
        greenLabel.text = "Green:"
        blueLabel.text = "Blue:"
    }
    
    private func updateSliderValueLabels() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    }
}
