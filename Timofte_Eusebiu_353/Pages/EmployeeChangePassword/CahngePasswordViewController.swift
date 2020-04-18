//
//  CahngePasswordViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/18/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit

class CahngePasswordViewController: UIViewController {

    @IBOutlet weak var oldPasswordTextField: UITextField!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatNewPasswordTextField: UITextField!
    
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    
    @IBAction func changePassword(_ sender: UIButton) {
        
        if oldPasswordTextField.text! != DataBase.getLoggedUser().password {
            warningLabel.text = "Parola gresita!"
            warningLabel.isHidden = false
        }else {
            if newPasswordTextField.text == "" || newPasswordTextField.text != repeatNewPasswordTextField.text {
                warningLabel.text = "Noua parola nu a fost confirmata!"
                warningLabel.isHidden = false
            } else {
                DataBase.setLoggedUserPassword(newPassword: newPasswordTextField.text!)
                let pc = (storyboard!.instantiateViewController(withIdentifier: "YourTableViewController") as? EmployeeProfileViewController)!
                self.navigationController!.pushViewController( pc, animated: true)
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        changeButton.titleLabel!.font = changeButton.titleLabel?.fontToFitHeight(height: changeButton.frame.height * CGFloat(2.5/3.0))
        changeButton.layoutIfNeeded()
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
