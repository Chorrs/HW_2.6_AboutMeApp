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
    
    var user: UserData!
    
    //перенос значения поля userNameField в строку с приветствием на HomeViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        guard let homeVC = segue.destination as? HomeViewController
        //        else { return }
        //
        //        homeVC.user = user.userName
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        tabBarController.viewControllers?.forEach{ viewController in
            if let welcomeVC = viewController as? HomeViewController {
                welcomeVC.userInHomeVC = user.userName
            } else if let navigationVC = viewController as? UINavigationController {
                if let personInfoVC = navigationVC.topViewController as? PersonInfoViewController {
                    personInfoVC.personInPersonInfoVC = user.person
                } else if let biographyVC = navigationVC.topViewController as? BiographyViewController {
                    biographyVC.userInBiographyViewController = user.person.biography
                }
            }
        }
    }
    
        // скрываем клавиатуру
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
        
        // валидация введённых данных
        override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            guard userNameField.text == user.userName ,
                  passwordField.text == user.userPassword
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
        
        @IBAction func forgotUserNameButtonPressed() {
            showAlert(
                title: "",
                message: "Your User Name is \(user.userName)")
        }
        
        @IBAction func forgotPasswordButtonPressed() {
            showAlert(
                title: "",
                message: "Your password is \(user.userPassword)",
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
    

