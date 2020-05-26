//
//  EmployerProfileViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/20/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class EmployerProfileViewController: UIViewController {
        let db = Firestore.firestore()
    
        var userKeywords: [String] = []
        @IBOutlet var rootView: UIView!
        @IBOutlet weak var keywords: UILabel!
    
        @IBOutlet weak var usernameLabel: UILabel!
        @IBOutlet weak var usernameValue: UILabel!
        @IBOutlet weak var changePasswordButton: UIButton!
        
        @IBOutlet weak var logoutButton: UIButton!
        
        @IBOutlet weak var emailLabel: UILabel!
        @IBOutlet weak var emailValue: UILabel!
    
    
        
        @IBAction func logout(_ sender: UIButton) {
            
            try! Auth.auth().signOut()
            
            let loginController =
                (storyboard!.instantiateViewController(withIdentifier: "loginController") as? LoginViewController)!
            loginController.modalPresentationStyle = .fullScreen
            loginController.modalTransitionStyle = .crossDissolve
            self.present(loginController, animated: true, completion: nil)
            
        }
        
        
    @IBOutlet weak var employerNameLabel: UILabel!
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            
            if UIScreen.main.bounds.width > 500 {
                
                let screenHeight = UIScreen.main.bounds.height
                let multiplier = CGFloat(22)
                
                
                
                usernameLabel.font = usernameLabel.fontToFitHeight(height: screenHeight/multiplier)
                usernameLabel.sizeToFit()
                usernameValue.font = usernameValue.fontToFitHeight(height: screenHeight/multiplier)
                usernameValue.sizeToFit()
                emailLabel.font = emailLabel.fontToFitHeight(height: screenHeight/multiplier)
                emailLabel.sizeToFit()
                emailValue.font = emailValue.fontToFitHeight(height: screenHeight/multiplier)
                emailValue.sizeToFit()
                keywords.font = keywords.fontToFitHeight(height: screenHeight/multiplier)
                keywords.sizeToFit()
                
                employerNameLabel.font = employerNameLabel.fontToFitHeight(height: screenHeight/multiplier)
                employerNameLabel.sizeToFit()
                
                
                changePasswordButton.titleLabel!.font = changePasswordButton.titleLabel?.fontToFitHeight(height: changePasswordButton.frame.height * CGFloat(2.0/3.0))
                changePasswordButton.layoutIfNeeded()
                logoutButton.titleLabel!.font = logoutButton.titleLabel?.fontToFitHeight(height: logoutButton.frame.height)
                logoutButton.layoutIfNeeded()
                
                rootView.layoutIfNeeded()
                
                
            }
            
            
            
        }
        

        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */
        
        override func viewWillAppear(_ animated: Bool) {
            getLoggedUser(completion: {
                (user, error) in
                if let error = error{
                    print(error)
                    return
                }else{
                    if let user = user{
                        self.usernameValue.text = user.username
                        self.emailValue.text = user.mail
                        self.employerNameLabel.text = user.name
                    }else{
                        print("Userul nu a fost gasit")
                        return
                    }
                }
            })
        }
    
    func getLoggedUser(completion: @escaping (Employer?, Error?) ->Void){
        db.collection("users").document(Auth.auth().currentUser!.uid).getDocument(completion: {
            (document, error) in
            if let error = error {
              print(error)
              completion(nil, error)
              return
            }
            
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                let data = document.data()!
                
                let employer = Employer(id: document.documentID, username: data["username"] as! String, password: data["password"] as! String, mail: data["mail"] as! String, keywords: [], cv: 0, name: data["name"] as! String)
                
                completion(employer, nil)
                
            } else {
                print("Document does not exist")
                completion(nil, nil)
            }
        })
    }
        

}
