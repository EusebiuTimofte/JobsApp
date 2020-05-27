//
//  ViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169246 on 4/6/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit
import Firebase




class TableViewController: UITableViewController {
    
    var jobs: [Job] = []

    let db = Firestore.firestore()
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.tableView.separatorColor = UIColor(cgColor: CGColor(srgbRed: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
        tableView.separatorStyle = .none
        //self.tableView.separatorInset = .init(top: 1.0, left: 0.0, bottom: 1.0, right: 1.0)
//        tableView.backgroundColor = UIColor(displayP3Red: CGFloat(255.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(0.0/255.0), alpha: CGFloat(1))
        tableView.backgroundColor = UIColor(displayP3Red: CGFloat(0.8), green: CGFloat(0.8), blue: CGFloat(0.8), alpha: CGFloat(1))
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiver = segue.destination as! JobDescriptionViewController
        let senderLet = sender as! FirstTableViewCell
        if let text = senderLet.cellTitle.text {
            receiver.jobTitleReceived = text
        }
        
        if let imageViewImage = senderLet.employerImage.image {
            receiver.employerImageReceived = imageViewImage
        }
        
        if let employerLet = senderLet.employer.text {
            receiver.employerReceived = employerLet
        }
        
        if let locationLet = senderLet.city.text {
            receiver.locationReceived = locationLet
        }
        
        if let publishDateLet = senderLet.publishDate.text {
            receiver.publishDateReceived = publishDateLet
        }
        
        receiver.descriptionValueReceived = senderLet.descriptionValue
        
        receiver.idReceived = senderLet.id
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobOfferCell") as! FirstTableViewCell
        
        cell.cellTitle.text = jobs[indexPath.row].title
        cell.employer.text = jobs[indexPath.row].employer
        cell.publishDate.text = jobs[indexPath.row].publishDate
        cell.city.text = jobs[indexPath.row].location
        cell.descriptionValue = jobs[indexPath.row].description
        cell.id = jobs[indexPath.row].id
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        getJobsFromFirestore()
    }
    
    func getJobsCurrentUserApplied(completion: @escaping ([String], Error?) -> Void) {
        var jobsArray: [String] = []
        db.collection("users").document(Auth.auth().currentUser!.uid).getDocument { (document, error) in
            if let error = error {
              print(error)
              completion(jobsArray, error)
              return
            }
            
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                let data = document.data()!
                jobsArray = data["jobsApplied"] as! [String]
                completion(jobsArray, nil)
            } else {
                print("Document does not exist")
                completion(jobsArray, nil)
            }
        }
      }
    
    func getJobsFromFirestore() {
        
        // trb sa fac o functie care sa ceara joburile la care a aplicat userul curent
        //functia trb sa aiba completion handler
        //dupa cand fac query la documente, mai intai apelez completion handlerul
        
        jobs = []
        
        db.collection("jobs").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.getJobsCurrentUserApplied(completion: { appliedJobs, error in
                    for document in querySnapshot!.documents {
                        var job: [String: Any] = [:]
                        //print("\(document.documentID) => \(document.data())")
                        job = document.data()
                        if appliedJobs.contains(document.documentID) {
                            continue
                        }
                        let jobObject = Job(id: document.documentID, title: job["title"] as! String, employer: job["employer"] as! String, location: job["location"] as! String, publishDate: job["publishDate"] as! String, description: job["description"] as! String, domain: job["domain"] as! String, employerId: job["employerId"] as! String)
                        self.jobs.append(jobObject)
                        
                    }
                    self.tableView.reloadData()
                })
                
            }
        }
    }
    
    
    


}



extension TableViewController: UISearchBarDelegate{
    
    
//    func getJobsCurrentUserApplied(completion: @escaping ([String], Error?) -> Void) {
//      var jobsArray: [String] = []
//      db.collection("users").document(Auth.auth().currentUser!.uid).getDocument { (document, error) in
//          if let error = error {
//            print(error)
//            completion(jobsArray, error)
//            return
//          }
//
//          if let document = document, document.exists {
//              let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//              print("Document data: \(dataDescription)")
//              let data = document.data()!
//              jobsArray = data["jobsApplied"] as! [String]
//              completion(jobsArray, nil)
//          } else {
//              print("Document does not exist")
//              completion(jobsArray, nil)
//          }
//      }
//    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        jobs = []
        
        db.collection("jobs").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.getJobsCurrentUserApplied(completion: { appliedJobs, error in
                    for document in querySnapshot!.documents {
                        var job: [String: Any] = [:]
                        //print("\(document.documentID) => \(document.data())")
                        job = document.data()
                        if appliedJobs.contains(document.documentID) {
                            continue
                        }
                        let jobObject = Job(id: document.documentID, title: job["title"] as! String, employer: job["employer"] as! String, location: job["location"] as! String, publishDate: job["publishDate"] as! String, description: job["description"] as! String, domain: job["domain"] as! String, employerId: job["employerId"] as! String)
                        if jobObject.description.lowercased().contains(searchText.lowercased()) || jobObject.title.lowercased().contains(searchText.lowercased())  || searchBar.text! == ""{
                            self.jobs.append(jobObject)
                        }
                        
                        
                    }
                    self.tableView.reloadData()
                })
                
            }
        }
    }
    
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        jobs = []
        
        db.collection("jobs").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.getJobsCurrentUserApplied(completion: { appliedJobs, error in
                    for document in querySnapshot!.documents {
                        var job: [String: Any] = [:]
                        //print("\(document.documentID) => \(document.data())")
                        job = document.data()
                        if appliedJobs.contains(document.documentID) {
                            continue
                        }
                        let jobObject = Job(id: document.documentID, title: job["title"] as! String, employer: job["employer"] as! String, location: job["location"] as! String, publishDate: job["publishDate"] as! String, description: job["description"] as! String, domain: job["domain"] as! String, employerId: job["employerId"] as! String)
                        if jobObject.description.lowercased().contains(searchBar.text!.lowercased()) || jobObject.title.lowercased().contains(searchBar.text!.lowercased())  || searchBar.text! == ""{
                            self.jobs.append(jobObject)
                        }
                        
                        
                    }
                    self.tableView.reloadData()
                })
                
            }
        }
    }
}

