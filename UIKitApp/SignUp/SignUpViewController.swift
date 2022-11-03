//
//  SignUpViewController.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import UIKit

final class SignUpViewController: UIViewController {

    @IBOutlet weak var txfEmail: myTextField!
    
    @IBOutlet weak var txfUserName: myTextField!
    
    @IBOutlet weak var txfPassword: myTextField!
    
    @IBOutlet weak var btnCustom: myButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configButton()
        configTextField()
    }
    
    func validar () -> Bool {
        guard let userEmail = self.txfEmail.text, userEmail != "" else {
           self.basica(title: "Atención", message: "Complete el campo correo")
           return false }
        
        guard let userName = self.txfUserName.text, userName != "" else {
            self.basica(title: "Atención", message: "Complete el campo de nombre")
            return false }
        guard userEmail.validarEmail else {
           self.basica(title: "Atención", message: "Verifique que el campo correo contenga los siguientes caracteres ejemplo@dominio.com")
           return false }
    
          guard let password = self.txfPassword.text, password != "" else {
            self.basica(title: "Atención", message: "Complete el campo contraseña")
            return false }
                  
          guard password.count >= 8 else {
             self.basica(title: "Atención", message: "son 8 caracteres minimos en  la contraseña")
                  return false }
          return true
       }
    
    func configButton() {
        btnCustom.addShake()
    }
    
    func configTextField() {
        txfEmail.addShake()
        txfPassword.addShake()
        txfUserName.addShake()
    }
       
    
    // MARK: - IBActions
    @IBAction func didTapSignUp(_ sender: Any) {
        if self.validar() {
            self.basica(title: "Exito", message: "🙂")
            txfEmail.removeShake()
            txfPassword.removeShake()
            txfUserName.removeShake()
        }
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        
    }
}

// MARK: - Static Methods
extension SignUpViewController {
    static func getViewController() -> SignUpViewController {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        guard let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {
            fatalError("ViewController must be of type SignUpViewController")
        }
        return signUpViewController
    }
}
