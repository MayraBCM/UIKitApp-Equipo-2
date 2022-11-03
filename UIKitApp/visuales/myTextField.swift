//
//  myTextField.swift
//  UIKitApp
//
//  Created by Mayra Brenda Carreño Mondragon on 01/11/22.
//

import Foundation
import UIKit

class myTextField: UITextField {
    @IBInspectable   public var textStyle: Int = 0 {
        didSet{
            style = myTextFieldStyle(rawValue: textStyle) ?? .one
        }
    }
    
    public var style: myTextFieldStyle = myTextFieldStyle.one{
        didSet{
            loadStyle()
        }
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        loadStyle()
    }
    
    func loadStyle(){
        switch style {
        case .one:
            self.textColor = .black
            self.backgroundColor = .gray
           
        case .two:
            self.textColor = .darkGray
            self.backgroundColor = .white
           
        case .three:
            self.textColor = .white
            self.backgroundColor = .systemBlue
            
        case .four:
            self.textColor = .white
            self.backgroundColor = .systemPink
         
        case .five:
            self.textColor = .white
            self.backgroundColor = .black
            
        }
    }
    
    func addShake(angle: Double = 0.04){
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [-angle, angle]
        animation.autoreverses = true
        animation.duration = randomInterval(0.12, variance: 0.025)
        animation.repeatCount = Float.infinity
        self.layer.add(animation, forKey: "animation")
        
        let animationTwo = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animationTwo.values = [4.0, 0.0]
        animationTwo.autoreverses = true
        animationTwo.duration = randomInterval(0.12, variance: 0.025)
        animationTwo.repeatCount = Float.infinity
        self.layer.add(animation, forKey: "animationTwo")
        
    }
    
    func randomInterval(_ interval: TimeInterval, variance: Double) -> TimeInterval {
        return interval + variance * Double((Double(arc4random_uniform(50)) - 500.0 / 500.0))
    }
    
    func removeShake() {
        self.layer.removeAllAnimations()
    }
}

