//
//  SignUpViewController.swift
//  byDataModelUserSignallAndSaveData
//
//  Created by MacBook Pro on 2/6/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func signUpButton(_ sender: Any) {
        
        if emailTextField.text != "" || passwordTextField.text != ""{
            
           let userInfo = DataModel(email: emailTextField.text ?? "email", password: passwordTextField.text ?? "pass")
            
            defaults.set(emailTextField.text, forKey: "email")
            defaults.set(passwordTextField.text, forKey: "pass")
            
            
            let vc = storyboard?.instantiateViewController(identifier: "SignInViewController") as! SignInViewController
            navigationController?.pushViewController(vc, animated: true)
        }else{
            Alert()
            return
        }
        
        
    }

    
    func Alert(){
        
        let alert = UIAlertController(title: "Oops!", message: "You are trying Empty TextFileds", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.cancel, handler: {_ in}))
        self.present(alert, animated: true, completion: nil)
    }
    

}
