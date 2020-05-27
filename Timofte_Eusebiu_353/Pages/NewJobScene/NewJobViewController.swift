//
//  NewJobViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/20/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit
import FirebaseFirestoreSwift
import Firebase

class NewJobViewController: UIViewController {

    let db = Firestore.firestore()
    
    @IBOutlet weak var jobTitle: UILabel!
    
    @IBOutlet weak var jobTitleInput: UITextField!
    
    @IBOutlet weak var locationInput: UITextField!
    
    @IBOutlet weak var descriptionInput: UITextView!
    
    @IBOutlet weak var domainInput: UITextField!
    
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var warning: FontHeightAdjustableLabel!
    
    @IBAction func createJob(_ sender: UIButton) {
        if jobTitleInput.text != "" && locationInput.text != "" && descriptionInput.text != "" && domainInput.text != "" {
            
            // am datele si trb sa fac jobul. trb sa iau employer name si employer id ca sa pot crea jobul. pt asta e nevoie sa cer userul curent logat si in completion handler trb sa fac database.update
            // dupa iau toti userii si pt fiecare user verific daca descrierea jobului contine un keyword , caz in care adaug in database o notificare cu id ul userului si id ul jobului si seen : false
            var job: [String: Any] = [:]
            job["title"] = jobTitleInput.text
            job["location"] = locationInput.text
            job["description"] = descriptionInput.text!
            job["domain"] = domainInput.text!
            job["publishDate"] = "12/06/2020"
            
            getLoggedUser(completion: {
                (employer, error) in
                job["employer"] = employer!.name
                job["employerId"] = employer!.id
                let jobDocument = self.db.collection("jobs").document()
                jobDocument.setData(job)
                
                //creem notificatiunile
                //mai intai trecem prin toti userii
                self.db.collection("users").whereField("type", isEqualTo: "employee").getDocuments(completion: {
                    (snapshot, error) in
                    if let error = error{
                        print(error.localizedDescription)
                        return
                    }else{
                        for document in snapshot!.documents{
                            // documentul reprezinta userul emplyee
                            //trb sa ma plimb prin keywords si sa vad daca descrierea contine vreunul. daca da, creez notificare si break, nyeez
                            let data = document.data()
                            let keywords: [String] = data["keywords"] as! [String]
                            for keyword in keywords{
                                if (job["description"] as! String).lowercased().contains(keyword.lowercased()) {
                                    //add notification
                                    var notificationData: [String:Any] = [:]
                                    notificationData["jobId"] = jobDocument.documentID
                                    notificationData["userId"] = document.documentID
                                    notificationData["seen"] = false
                                    self.db.collection("notifications").addDocument(data: notificationData)
                                    break
                                }
                            }
                        }
                    }
                })
            })
            
            //mai bagam employer si employer id, trb sa luam logged user din db
            
            
            
//            
//            for i in 0..<DataBase.users[0].keywords.count {
//                let loopKeyword = DataBase.users[0].keywords[i]
//                if jobAdded.description.lowercased().contains(loopKeyword.lowercased()) || jobAdded.domain.lowercased().contains(loopKeyword.lowercased()) || jobAdded.location.lowercased().contains(loopKeyword.lowercased()) || jobAdded.title.lowercased().contains(loopKeyword.lowercased()) || jobAdded.employer.lowercased().contains(loopKeyword.lowercased()) {
//                    DataBase.notifications.append((jobAdded,true))
//                    break
//                }
//            }
            
            
            
            warning.text = "Job creat cu succes!"
            warning.textColor = .green
            warning.isHidden = false
        }else {
            warning.text = "Toate campurile sunt obligatorii!"
            warning.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        jobTitleInput.font = jobTitle.fontToFitHeight(height: jobTitleInput.frame.height * CGFloat(2.0/3.0))
        jobTitleInput.sizeToFit()
        locationInput.font = jobTitle.fontToFitHeight(height: locationInput.frame.height * CGFloat(2.0/3.0))
        locationInput.sizeToFit()
        descriptionInput.font = jobTitle.fontToFitHeight(height: UIScreen.main.bounds.height * CGFloat(0.1/3.0))
        //descriptionInput.sizeToFit()
        domainInput.font  = jobTitle.fontToFitHeight(height: domainInput.frame.height * CGFloat(2.0/3.0))
        descriptionInput.sizeToFit()
        createButton.titleLabel?.font = createButton.titleLabel?.fontToFitHeight(height: createButton.frame.size.height * CGFloat(2.0/3.0))
        descriptionInput.layer.borderWidth = CGFloat(UIScreen.main.bounds.height / CGFloat(300))
        descriptionInput.layoutIfNeeded()
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
