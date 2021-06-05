//
//  HomeViewController.swift
//  byDataModelUserSignallAndSaveData
//
//  Created by MacBook Pro on 2/6/21.
//

import UIKit

class HomeViewController: UIViewController {

    var defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

      //defaults.removeObject(forKey: "islogin")
        
    }
//    override func viewDidAppear(_ animated: Bool) {
//        navigationController?.navigationBar.isHidden = false
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        navigationController?.navigationBar.isHidden = true
//    }


    @IBAction func logOutButton(_ sender: Any) {
        
        defaults.set(false, forKey: "islogin")
        
        let vc = storyboard?.instantiateViewController(identifier: "SignInViewController") as! SignInViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
