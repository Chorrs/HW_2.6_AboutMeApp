//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Chorrs on 6.10.23.
//

import UIKit

final class LogInViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private  let correctUserName = "user"
    private  let correctPassword = "password"
    
    
    // скрываем клавиатуру
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // валидация введённых данных
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameField.text == correctUserName ,
              passwordField.text == correctPassword
        else {
            // Введенные данные некорректны, показываем alert controller
            showAlert(
                title: "Autorization error",
                message: "Input data is not correct",
                textField: passwordField)
            
            return false
        }
        return true
    }
    
    //перенос значения поля userNameField в строку с приветствием на HomeViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let homeVC = segue.destination as? HomeViewController
        else { return }
        homeVC.user = userNameField.text ?? ""
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(
            title: "",
            message: "Your User Name is \(correctUserName)")
    }
        
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(
            title: "",
            message: "Your password is \(correctPassword)",
            textField: passwordField)
    }
        
    // Возврат на логин-экран при нажатии на кнопку "log out"
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameField.text = ""
        passwordField.text = ""
    }
    
    private func showAlert(
        title: String,
        message: String,
        textField: UITextField? = nil) {
            
            let alertController = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default){
                _ in textField?.text = ""
            }
            alertController.addAction(okAction)
            present(alertController, animated: true)
            
        }
    
}

