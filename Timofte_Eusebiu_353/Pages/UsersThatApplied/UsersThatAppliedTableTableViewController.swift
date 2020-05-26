//
//  UsersThatAppliedTableTableViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/20/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit
import FirebaseFirestoreSwift
import Firebase

class UsersThatAppliedTableTableViewController: UITableViewController {

    let db = Firestore.firestore()
    
   var jobs: [Job] = []
    var userJob: [(User,Job)] = []
       
       override func viewDidLoad() {
           super.viewDidLoad()
        jobs = []
           // Do any additional setup after loading the view.
   //        self.tableView.separatorColor = UIColor(cgColor: CGColor(srgbRed: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
           tableView.separatorStyle = .none
           //self.tableView.separatorInset = .init(top: 1.0, left: 0.0, bottom: 1.0, right: 1.0)
   //        tableView.backgroundColor = UIColor(displayP3Red: CGFloat(255.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(0.0/255.0), alpha: CGFloat(1))
           tableView.backgroundColor = UIColor(displayP3Red: CGFloat(0.8), green: CGFloat(0.8), blue: CGFloat(0.8), alpha: CGFloat(1))
           
       }
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let receiver = segue.destination as! UserThatAppliedDescriptionViewController
           let senderLet = sender as! UserTableViewCell
           if let text = senderLet.city.text {
               receiver.jobTitleReceived = text
           }
           
           if let imageViewImage = senderLet.employerImage.image {
               receiver.employerImageReceived = imageViewImage
           }
           
           if let employerLet = senderLet.user?.username {
               receiver.employerReceived = employerLet
           }
           
        if let locationLet = senderLet.user?.mail {
               receiver.locationReceived = locationLet
           }
        
        receiver.user = senderLet.user
        receiver.job = senderLet.job
       }
       
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return userJob.count
       }
       
       override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return tableView.frame.size.height / 5
       }
       
       override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           cell.tintColor = .red
   //        cell.accessoryView?.backgroundColor = .orange
   //        cell.accessoryView?.backgroundColor?.withAlphaComponent(1)
           
   //        cell.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
   //        cell.contentView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
   //        cell.contentView.backgroundColor = .green
       }
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell = tableView.dequeueReusableCell(withIdentifier: "JobOfferCell") as! UserTableViewCell
        
        cell.user = userJob[indexPath.row].0
        cell.job = userJob[indexPath.row].1
           
        cell.cellTitle.text = cell.user?.username
           cell.employer.text = "16/04/2020"
        cell.city.text = cell.job!.title
            return cell
       }
       
   //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   //
   //    }
   
   override func viewWillAppear(_ animated: Bool) {
       userJob = []
    getEmployerJobs(completion: {
        (localJobs, error) in
        if let error = error{
            print(error.localizedDescription)
        }else{
            self.db.collection("users").whereField("type", isEqualTo: "employee").getDocuments(completion: {
                (snapshot, error) in
                if let error = error{
                    print(error.localizedDescription)
                    return
                }else{
                    for document in snapshot!.documents{
                        let data = document.data()
                        let localUser = User(id: document.documentID, username: data["username"] as! String, password: data["password"] as! String, mail: data["mail"] as! String, keywords: data["keywords"] as! [String], cv: 0, userType: .employee)
                        
                        if let jobsAppliedData = data["jobsApplied"] {
                            let jobsApplied = jobsAppliedData as! [String]
                            for job in localJobs {
                                if jobsApplied.contains(job.id){
                                    self.userJob.append((localUser, job))
                                }
                            }
                        }
                    }
                    self.tableView.reloadData()
                }
                
            })
        }
    })
       //tableView.reloadData()
   }
    
    func getEmployerJobs(completion: @escaping([Job], Error?) -> Void){
        var localJobs:[Job] = []
        db.collection("jobs").whereField("employerId", isEqualTo: Auth.auth().currentUser!.uid).getDocuments(completion: {
            (snapshot, error) in
            if let error = error{
                print("error when querying jobs" + error.localizedDescription)
                completion(localJobs, error)
            }else{
                for document in snapshot!.documents {
                    let data = document.data()
                    let jobLocal = Job(id: document.documentID, title: data["title"] as! String, employer: data["employer"] as! String, location: data["location"] as! String, publishDate: data["publishDate"] as! String, description: data["description"] as! String, domain: data["domain"] as! String, employerId: data["employerId"] as! String)
                    localJobs.append(jobLocal)
                }
                completion(localJobs, nil)
            }
        })
    }

}
