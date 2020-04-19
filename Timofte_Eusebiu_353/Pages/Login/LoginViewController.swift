//
//  LoginViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/19/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: FontHeightAdjustableLabel!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var Warning: UILabel!
    @IBAction func login(_ sender: UIButton) {
        
        let loginResult = DataBase.login(username: usernameInput.text!, password: passwordInput.text!)
        if loginResult != "Success" {
            Warning.text = loginResult
            Warning.isHidden = false
        }else {
            let tabBarController =
                (storyboard!.instantiateViewController(withIdentifier: "employeeTabBarController") as? UITabBarController)!
            self.navigationController!.pushViewController( tabBarController, animated: true)
            //delete last view from navigation history
            var viewControllersVar = navigationController?.viewControllers
            let indexToRemove = viewControllersVar!.count - 2
            viewControllersVar?.remove(at: indexToRemove)
            navigationController?.viewControllers = viewControllersVar!
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordInput.font = username.fontToFitHeight(height: passwordInput.frame.height * CGFloat(2.0/3.0))
        passwordInput.layoutIfNeeded()
        usernameInput.font = username.fontToFitHeight(height: usernameInput.frame.height * CGFloat(2.0/3.0))
        usernameInput.layoutIfNeeded()
        loginButton.titleLabel!.font = loginButton.titleLabel?.fontToFitHeight(height: loginButton.frame.height)
        loginButton.layoutIfNeeded()
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
