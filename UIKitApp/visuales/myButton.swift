//
//  myButton.swift
//  wezlineDeme
//
//  Created by Mayra Brenda Carreño Mondragon on 01/11/22.
//

import Foundation
import UIKit

class myButton: UIButton {
    
 @IBInspectable   public var buttonStyle: Int = 0 {
        didSet{
            style = myButtonStyle(rawValue: buttonStyle) ?? .one
        }
    }
    
    public var style: myButtonStyle = myButtonStyle.one{
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
            self.backgroundColor = .red
            self.layer.cornerRadius = 20
        case .two:
            self.backgroundColor = .green
            self.layer.cornerRadius = 10
        case .three:
            self.backgroundColor = .blue
            self.layer.cornerRadius = 15
        case .four:
            self.backgroundColor = .systemPink
            self.layer.cornerRadius = 5
        case .five:
            self.backgroundColor = .black
            self.layer.cornerRadius = 20
        }
    }
    
    func addShake(angle: Double = 0.04){
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [-angle, angle]
        animation.autoreverses = true
        animation.duration = randomInterval(0.12, variance: 0.025)
        animation.repeatCount = 4
        self.layer.add(animation, forKey: "animation")
        
        let animationTwo = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animationTwo.values = [4.0, 0.0]
        animationTwo.autoreverses = true
        animationTwo.duration = randomInterval(0.12, variance: 0.025)
        animationTwo.repeatCount = 4
        self.layer.add(animation, forKey: "animationTwo")
        
    }
    
    func randomInterval(_ interval: TimeInterval, variance: Double) -> TimeInterval {
        return interval + variance * Double((Double(arc4random_uniform(10)) - 500.0 / 500.0))
    }
    
    func removeShake() {
        self.layer.removeAllAnimations()
    }
}
