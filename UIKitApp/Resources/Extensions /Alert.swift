//
//  Alert.swift
//  UIKitApp
//
//  Created by mvazquezl on 03/11/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func basica (title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
    
