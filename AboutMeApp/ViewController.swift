//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Chorrs on 6.10.23.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    // скрываем клавиатуру
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // валидация введённых данных
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameField.text == "user" ,
                passwordField.text == "password"
        else {
            // Введенные данные некорректны, показываем alert controller
            let alertController = UIAlertController(
                title: "Autorization error",
                message: "Input data is not correct",
                preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil))
            
            present(alertController,
                    animated: true,
                    completion: nil)
            
            passwordField.text = ""
            return false
        }
        
        guard userNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" ,
              passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""
        else {
            // Введённые данные некорректны, показываем alert controller
            let alertController = UIAlertController(
                title: "Autorization error",
                message: "Please fill in all fields",
                preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil))
            
            present(alertController,
                    animated: true,
                    completion: nil)
            return false
        }
        // Введенные данные корректны, разрешаем выполнение segue
       performSegue(withIdentifier: "Hello", sender: nil)
        return true
    }
    
    
    //перенос значения поля userNameField в строку с приветствием на HomeViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let homeVC = segue.destination as? HomeViewController else { return }
        homeVC.welcomeText = "Hello, \(userNameField.text ?? "")"
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        let alertController = UIAlertController(
            title: "",
            message: "Your User Name is \"user\"",
            preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil))
        
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        let alertController = UIAlertController(
            title: "",
            message: "Your password is \"password\"",
            preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil))
        
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        shouldPerformSegue(withIdentifier: "Hello", sender: nil)
    }
    
    // Возврат на логин-экран при нажатии на кнопку "log out"
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameField.text = ""
        passwordField.text = ""
    }
    
    private func setUpElements() {
        
        userNameField.layer.cornerRadius = 20
        passwordField.layer.cornerRadius = 20
        forgotUserNameButton.layer.cornerRadius = 20
        forgotPasswordButton.layer.cornerRadius = 20
        logInButton.layer.cornerRadius = 7
        
    }
    
}

