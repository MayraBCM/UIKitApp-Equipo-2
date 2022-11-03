//
//  characters.swift
//  UIKitApp
//
//  Created by mvazquezl on 03/11/22.
//

import Foundation

extension String {
    var validarEmail: Bool {
        let emailRegex = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        let emailTest = NSPredicate (format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
}
    var validarTexto: Bool {
            let textRegex = "(\\S[A-ZÑÁÉÍÓÚÜ\\sa-zñáéíóúü\\s]{3,50})"
            let textTest = NSPredicate(format: "SELF MATCHES %@", textRegex)
            return textTest.evaluate(with: self)
        }
}
