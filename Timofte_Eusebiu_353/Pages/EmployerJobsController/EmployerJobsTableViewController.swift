//
//  EmployerJobsTableViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/20/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class EmployerJobsTableViewController: UITableViewController {

    var jobs: [Job] = []
        
    let db = Firestore.firestore()
    
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
            let receiver = segue.destination as! EmployerJobDescriptionViewController
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        jobs = []
        db.collection("jobs").whereField("employerId", isEqualTo: Auth.auth().currentUser!.uid).getDocuments(completion: {
            (snapshot, error) in
            if let error = error{
                print("error when querying jobs" + error.localizedDescription)
                return
            }else{
                for document in snapshot!.documents {
                    let data = document.data()
                    let jobLocal = Job(id: document.documentID, title: data["title"] as! String, employer: data["employer"] as! String, location: data["location"] as! String, publishDate: data["publishDate"] as! String, description: data["description"] as! String, domain: data["domain"] as! String, employerId: data["employerId"] as! String)
                    self.jobs.append(jobLocal)
                }
                self.tableView.reloadData()
            }
        })
        
    }

}
