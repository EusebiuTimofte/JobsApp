//
//  EmployeeProfileViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/18/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit
import MobileCoreServices
import FirebaseFirestoreSwift
import Firebase


class EmployeeProfileViewController: UIViewController, UIDocumentPickerDelegate, UIDocumentMenuDelegate {
    
    let db = Firestore.firestore()

    @IBOutlet var deleteKeyword: [UIButton]!
    @IBOutlet var keywordLabels: [UILabel]!
    var userKeywords: [String] = []
    @IBOutlet var rootView: UIView!
    @IBOutlet weak var keywords: UILabel!
    
    @IBAction func uploadCV(_ sender: UIButton) {
        let importMenu = UIDocumentMenuViewController(documentTypes: [String(kUTTypePDF)], in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        self.present(importMenu, animated: true, completion: nil)
        
    }
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameValue: UILabel!
    @IBOutlet weak var changePasswordButton: UIButton!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var cvButton: UIButton!
    @IBOutlet weak var documentName: UILabel!
    
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
    
    @IBAction func addNewKeyword(_ sender: UIButton) {
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "New Keyword", message: "Enter keyword", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "Keyword"
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            //DataBase.addLoggedUserKeyword(keyword: textField!.text!)
            self.db.collection("users").document(Auth.auth().currentUser!.uid).updateData([
                "keywords": FieldValue.arrayUnion([textField!.text!])
            ])
            self.viewWillAppear(true)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func firstKeywordDelete(_ sender: UIButton) {
        //DataBase.removeLoggedUserKeyword(at: 0)
        self.db.collection("users").document(Auth.auth().currentUser!.uid).updateData([
            "keywords": FieldValue.arrayRemove([keywordLabels[0].text!])
        ])
        viewWillAppear(true)
    }
    
    @IBAction func secondKeywordDelete(_ sender: UIButton) {
        //DataBase.removeLoggedUserKeyword(at: 1)
        self.db.collection("users").document(Auth.auth().currentUser!.uid).updateData([
            "keywords": FieldValue.arrayRemove([keywordLabels[1].text!])
        ])
        viewWillAppear(true)
    }
    @IBAction func thirdKeywordDelete(_ sender: UIButton) {
        //DataBase.removeLoggedUserKeyword(at: 2)
        self.db.collection("users").document(Auth.auth().currentUser!.uid).updateData([
            "keywords": FieldValue.arrayRemove([keywordLabels[2].text!])
        ])
        viewWillAppear(true)
    }
    
    @IBOutlet weak var newKeywordButton: UIButton!
    @IBAction func fourthKeywordDelete(_ sender: UIButton) {
        //DataBase.removeLoggedUserKeyword(at: 3)
        self.db.collection("users").document(Auth.auth().currentUser!.uid).updateData([
            "keywords": FieldValue.arrayRemove([keywordLabels[3].text!])
        ])
        viewWillAppear(true)
    }
    
    
    
    
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
            
            newKeywordButton.titleLabel?.font = newKeywordButton.titleLabel?.fontToFitHeight(height: newKeywordButton.frame.height)
            
            
            for i in 0..<keywordLabels.count {
                keywordLabels[i].font = keywordLabels[i].fontToFitHeight(height: screenHeight/multiplier)
                keywordLabels[i].sizeToFit()
                
//                deleteKeyword[i].frame.size = CGSize(width: screenHeight/multiplier, height: screenHeight/multiplier)
//                deleteKeyword[i].imageView?.frame.size = CGSize(width: screenHeight/multiplier, height: screenHeight/multiplier)
//                deleteKeyword[i].imageView?.contentMode = .scaleToFill
                
//                rootView.addConstraint(NSLayoutConstraint(item: deleteKeyword[i], attribute: .height, relatedBy: .equal, toItem: rootView, attribute: .height, multiplier: CGFloat(0.08), constant: CGFloat(0)))
//                deleteKeyword[i].addConstraint(NSLayoutConstraint(item: deleteKeyword[i], attribute: .width, relatedBy: .equal, toItem: deleteKeyword[i], attribute: .height, multiplier: CGFloat(1), constant: CGFloat(0)))
//                deleteKeyword[i].imageEdgeInsets = UIEdgeInsets(top: CGFloat(30), left: CGFloat(30), bottom: CGFloat(30), right: CGFloat(30))
//                deleteKeyword[i].layoutIfNeeded()
            }
            
            cvButton.titleLabel!.font = cvButton.titleLabel?.fontToFitHeight(height: cvButton.frame.height * CGFloat(2.0/3/0))
            cvButton.layoutIfNeeded()
            
            documentName.font = documentName.fontToFitHeight(height: screenHeight/multiplier)
            documentName.sizeToFit()
            
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
    
    func getLoggedUser(completion: @escaping (User?, Error?) ->Void){
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
                
                
                if data["type"] as! String == "employee" {
                    let user = User(id: document.documentID, username: data["username"] as! String, password: data["password"] as! String, mail: data["mail"] as! String, keywords: data["keywords"] as! [String], cv: 0, userType: .employee)
                    completion(user, nil)
                }else {
                    let user = User(id: document.documentID, username: data["username"] as! String, password: data["password"] as! String, mail: data["mail"] as! String, keywords: data["keywords"] as! [String], cv: 0, userType: .employer)
                    completion(user, nil)
                }
                
            } else {
                print("Document does not exist")
                completion(nil, nil)
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
         //let loggedUser = DataBase.getLoggedUser()
        getLoggedUser(completion: {
            (user, error) in
            if let error = error{
                print(error)
                return
            }else{
                if let user = user{
                    self.usernameValue.text = user.username
                    self.emailValue.text = user.mail
                    self.userKeywords = user.keywords
                    
                    if self.userKeywords.count >= 4 {
                        self.newKeywordButton.isEnabled = false
                    }else {
                        self.newKeywordButton.isEnabled = true
                    }
                    
                    for i in 0..<min(self.userKeywords.count, self.keywordLabels.count) {
                        self.keywordLabels[i].text = self.userKeywords[i]
                        self.keywordLabels[i].isHidden = false
                        self.deleteKeyword[i].isHidden = false
                    }
                    
                    for i in self.userKeywords.count..<self.keywordLabels.count {
                        self.keywordLabels[i].isHidden = true
                        self.deleteKeyword[i].isHidden = true
                    }
                }else{
                    print("Userul nu a fost gasit")
                    return
                }
            }
        })
    }
    
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
                  guard let myURL = urls.first else {
                       return
                  }
                  print("import result : \(myURL)")
        }


    public func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
            documentPicker.delegate = self
            present(documentPicker, animated: true, completion: nil)
        }


    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
                print("view was cancelled")
                dismiss(animated: true, completion: nil)
        }

}
