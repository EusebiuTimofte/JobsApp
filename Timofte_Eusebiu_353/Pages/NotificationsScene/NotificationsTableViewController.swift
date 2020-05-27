//
//  NotificationsTableViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/20/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class NotificationsTableViewController: UITableViewController {

    let db = Firestore.firestore()
    
    var notifications: [(Job, Bool)] = []
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
            return notifications.count
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
            
            cell.cellTitle.text = notifications[indexPath.row].0.title
            cell.employer.text = notifications[indexPath.row].0.employer
            cell.publishDate.text = notifications[indexPath.row].0.publishDate
            cell.city.text = notifications[indexPath.row].0.location
            cell.descriptionValue = notifications[indexPath.row].0.description
            cell.id = notifications[indexPath.row].0.id
            if notifications[indexPath.row].1 == false {
                cell.backgroundColor = .orange
            }else {
                cell.backgroundColor = .white
            }
            return cell
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //DataBase.notificationSeen(notification: notifications[indexPath.row])
        db.collection("notifications").whereField("userId", isEqualTo: Auth.auth().currentUser!.uid).whereField("jobId", isEqualTo: notifications[indexPath.row].0.id).getDocuments(completion: {
            (snapshot, error) in
            if let error = error{
                print(error.localizedDescription)
            }else{
                for document in snapshot!.documents{
                    self.db.collection("notifications").document(document.documentID).updateData(["seen": true])
                }
                (self.tabBarController as! EmployeeTabBarViewController).updateBadge()
            }
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //notifications = DataBase.getNotifications()
        getNotifications {
            self.tableView.reloadData()
        }
    }
    
    // am user id, pot lua toate docomentele care reprezinta notificari ale userului si le pot stoca undeva
    //chestia asta o bag intr-o functie care sa returneze documentele
    //iau si query snapshot ul cu toate joburile
    
    func getNotifications(completion: @escaping()->Void){
        notifications = []
        self.db.collection("notifications").whereField("userId", isEqualTo: Auth.auth().currentUser!.uid).getDocuments(completion: {
            (snapshot, error) in
            if let error = error{
                print(error.localizedDescription)
                completion()
            }else{
                //iterate through notifications
                for document in snapshot!.documents {
                    let data = document.data()
                    self.db.collection("jobs").document(data["jobId"] as! String).getDocument(completion: {
                        (localJob, error) in
                        if let error = error{
                            print(error.localizedDescription)
                            return
                        }
                        let localJobData = localJob!.data()!
                        let jobObject = Job(id: localJob!.documentID, title: localJobData["title"] as! String, employer: localJobData["employer"] as! String, location: localJobData["location"] as! String, publishDate: localJobData["publishDate"] as! String, description: localJobData["description"] as! String, domain: localJobData["domain"] as! String, employerId: localJobData["employerId"] as! String)
                        self.notifications.append((jobObject, data["seen"] as! Bool))
                        self.tableView.reloadData()
                    })
                }
                completion()
            }
        })
    }

}
