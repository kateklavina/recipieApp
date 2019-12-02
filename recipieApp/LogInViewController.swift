//
//  ViewController.swift
//  recipieApp
//
//  Created by Dace Laizane on 02/12/2019.
//  Copyright © 2019 Kate Klavina. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var paswordTextField: UITextField!
    
    
    private let userName = "kate"
    private let pasword = "12345"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
        guard segue.identifier == "recepie" else {return}
        let welcomeVC = segue.destination as! FirstTableViewController
        
           // Pass the selected object to the new view controller.
        welcomeVC.userName = usernameTextField.text
        view.endEditing(true)
       }

    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        
    }
    
    
    @IBAction func logInTapped() {
    

    
    
        guard usernameTextField.text == userName, paswordTextField.text == pasword
        else {warningPopup(withTitle: "Invalid login or pasword", withMessage: "Please enter correct login/password")
            return
    }
        performSegue(withIdentifier: "recepie", sender: nil)
        
    }
    }
    
//end VC

extension UIViewController {
 func warningPopup (withTitle title: String?, withMessage message: String?){
     DispatchQueue.main.async {
        
         let popUP = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
         popUP.addAction(okButton)
         self.present(popUP, animated: true, completion: nil)
     }
}
}
// MARK: Text Field Delegate
extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            textField.resignFirstResponder()
            paswordTextField.becomeFirstResponder()
        } else {
            logInTapped()
        }
        return true
    }
}

