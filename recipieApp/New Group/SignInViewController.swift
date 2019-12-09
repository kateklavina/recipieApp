//
//  SignInViewController.swift
//  recipieApp
//
//  Created by Dace Laizane on 06/12/2019.
//  Copyright © 2019 Kate Klavina. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var paswordTextField: UITextField!
    
    private let userName = "am"
    private let password = "am"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.string(forKey: "userName") != nil {
           goToWelcomeViewController()
        }
    }
    
    @objc func keyboardWillShow(notification: Notification) {
           if self.view.frame.origin.y == 0{
               self.view.frame.origin.y -= 150
           }
       }
       
       @objc func keyboardWillHide(notification: Notification) {
           if self.view.frame.origin.y != 0 {
               self.view.frame.origin.y += 150
           }
       }
    
    func goToWelcomeViewController(){
        let initController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInViewController") as! FirstTableViewController
        
        //        initController.userName = userNameTextField.text
        view.endEditing(true)
        present(initController, animated: true, completion: nil)
    }
    
    @IBAction func signInTapped() {
        guard userNameTextField.text == userName, paswordTextField.text == password
            else {
                
                return
        }
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(password, forKey: "id")
        
        goToWelcomeViewController()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
       
        dismiss(animated: true, completion: nil)
        let defaults = UserDefaults.standard
            defaults.synchronize()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    

}// end VC

// MARK: Text Field Delegate
extension SignInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            paswordTextField.becomeFirstResponder()
        } else {
            signInTapped()
        }
        return true
    }
}

