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
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        changePasswordButton.titleLabel!.font = changePasswordButton.titleLabel?.fontToFitHeight(height: changePasswordButton.frame.height * CGFloat(2.0/3.0))
//        changePasswordButton.layoutIfNeeded()
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
