//
//  ViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169246 on 4/6/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.tableView.separatorColor = UIColor(cgColor: CGColor(srgbRed: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
        tableView.separatorStyle = .none
        //self.tableView.separatorInset = .init(top: 1.0, left: 0.0, bottom: 1.0, right: 1.0)
        
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
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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
        
        if indexPath.row % 2 == 0 {
            cell.cellTitle.text = "Cell \(indexPath.row) sjfhsd sdkjfsdkjf lsdkjfsdfj lsdfjslkdjf lsfdkj lksjdflk jsdl jksdlkj sdlkfj  jlk jsdfkjsd"
        }else {
            cell.cellTitle.text = "Cell \(indexPath.row) sjfhsd ldjkfgn dfkgj dlfkjg asdasd"
        }
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    


}

