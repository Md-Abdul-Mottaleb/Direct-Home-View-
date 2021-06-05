//
//  SignInViewController.swift
//  byDataModelUserSignallAndSaveData
//
//  Created by MacBook Pro on 2/6/21.
//

import UIKit

class SignInViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

      
       
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    @IBAction func signInButton(_ sender: Any) {
        
        if emailTextField.text != "" || passwordTextField.text != ""{
            
        let e = defaults.string(forKey: "email") ?? "a"
        let p = defaults.string(forKey: "pass") ?? "b"
            
            let user = DataModel(email: e, password: p)
            
            if emailTextField.text == user.email && passwordTextField.text == user.password{
                
                defaults.set(true, forKey: "islogin")
                
                let vc = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
                navigationController?.pushViewController(vc, animated: true)
            }else{
                Alert2()
            }
        }else{
            
            Alert3()
        }
        
    }
    
    
    @IBAction func goSignUpFromSignIn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func Alert2(){
        let alert = UIAlertController(title: "Oops!", message: "you are trying by wrong  information", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.cancel, handler: {_ in}))
        self.present(alert, animated: true, completion: nil)
    }
    func Alert3(){
        
        let alert = UIAlertController(title: "Oops!", message: "you are trying by Empty  information", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.cancel, handler: {_ in}))
        
        self.present(alert, animated: true, completion: nil)
    }
}
