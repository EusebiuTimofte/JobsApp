//
//  LoginViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/19/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class LoginViewController: UIViewController {
    
    var ref : DatabaseReference = Database.database().reference()
    let db = Firestore.firestore()

    @IBOutlet weak var username: FontHeightAdjustableLabel!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var Warning: UILabel!
    @IBAction func login(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: usernameInput.text!, password: passwordInput.text!) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if let error = error{
                strongSelf.Warning.text = error.localizedDescription
                strongSelf.Warning.isHidden = false
            }else{
                var user: [String: Any] = [:]
                
                strongSelf.db.collection("users").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            //print("\(document.documentID) => \(document.data())")
                            if document.documentID == authResult?.user.uid{
                                user = document.data()
                                break
                            }
                            
                        }
                        
                        var controllerName: String = ""
                        if user["type"] as! String == "employer" {
                            controllerName = "employerTabBarController"
                        }
                        if user["type"] as! String == "employee" {
                           controllerName = "employeeTabBarController"
                        }
                        let tabBarController =
                            (strongSelf.storyboard!.instantiateViewController(withIdentifier: controllerName) as? UITabBarController)!
                        tabBarController.modalPresentationStyle = .fullScreen
                        tabBarController.modalTransitionStyle = .crossDissolve
                        strongSelf.present(tabBarController, animated: true, completion: nil)
                        
                        
                    }
                }
                

            }
            
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
