//
//  ViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169246 on 4/6/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var jobs: [Job] = [
        Job(id: 1, title: "IT Specialist", employer: "Rezolv IT", location: "Remote", publishDate: "15/04/2020", description: "Asiguri suport IT specializat utilizatorilor pentru rezolvarea incidentelor cauzate de software/calculatoare/retea si pregătești documentarea și raportarea activitați către clienți în sistemul de ticketing", domain: "IT"),
        Job(id: 2, title: "Full Stack Developer", employer: "SC Boxador Labs SRL", location: "Iasi", publishDate: "12/04/2020", description: "We are looking for a talented full-stack developer with strong understanding of web technologies.You will work closely with our dedicated team of engineers and designers to help us improve our industry leading software used by thousands of people every day.", domain: "IT"),
        Job(id: 3, title: "Mobile QA Tester", employer: "Emerson Croft", location: "Bucuresti", publishDate: "16/04/2020", description: "You will identify flaws in processes and improve or replace them", domain: "IT"),
        Job(id: 4, title: "Frontend Developer w/ Wordpress Know-how", employer: "Inside Media Communication", location: "Bucuresti", publishDate: "13/04/2020", description: "We are looking for front-end developers with an eye for details and in-depth knowledge of modern front-end technologies that are capable of creating state-of-the-art web apps on top of Wordpress starting with a custom design.", domain: "IT"),
        Job(id: 5, title: "Embedded Software Developer E-mobility", employer: "PREH ROMANIA", location: "Iasi", publishDate: "10/04/2020", description: "Since 1919 Preh has stood for technical innovation and SME-style flexibility. Having started out as specialists for radio and subsequently TV electronics, the company has evolved over decades into a global supplier and much sought OEM Partner in the automotive sector.", domain: "IT"),
        Job(id: 6, title: "Inginer chimist", employer: "S.C. Biofarm S.A.", location: "Bucuresti", publishDate: "15/04/2020", description: "Organizeaza si repartizeaza sarcinile pentru fiecare loc de munca din echipa pe care o coordoneaza;Asigura folosirea completa a capacitatilor de productie si a fondului de timp, utilizand la randament maxim utilajele prin eliminarea intreruperilor sau deficientelor in functionare, datorate activitatii coordonate;Urmareste, verifica si inregistreaza parametrii tehnologici ai echipamentelor in dosarul de serie pentru fiecare serie de produs;Raspunde de completarea corecta si in timp real a dosarelor de serie pentru fiecare serie de produs;Coordoneaza utilizarea in fabricatie a produselor intermediare corespunzatoare din punct de vedere calitativ si cantitativ;", domain: "Farma")
    ]
    
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
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    


}

