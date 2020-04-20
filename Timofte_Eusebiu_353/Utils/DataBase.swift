//
//  DataBase.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/17/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import Foundation

class DataBase {
    static var jobs: [Job] = [
        Job(id: 1, title: "IT Specialist", employer: "Rezolv IT", location: "Remote", publishDate: "15/04/2020", description: "Asiguri suport IT specializat utilizatorilor pentru rezolvarea incidentelor cauzate de software/calculatoare/retea si pregătești documentarea și raportarea activitați către clienți în sistemul de ticketing", domain: "IT"),
        Job(id: 2, title: "Full Stack Developer", employer: "SC Boxador Labs SRL", location: "Iasi", publishDate: "12/04/2020", description: "We are looking for a talented full-stack developer with strong understanding of web technologies.You will work closely with our dedicated team of engineers and designers to help us improve our industry leading software used by thousands of people every day.", domain: "IT"),
        Job(id: 3, title: "Mobile QA Tester", employer: "Inside Media Communication", location: "Bucuresti", publishDate: "16/04/2020", description: "You will identify flaws in processes and improve or replace them", domain: "IT"),
        Job(id: 4, title: "Frontend Developer w/ Wordpress Know-how", employer: "Inside Media Communication", location: "Bucuresti", publishDate: "13/04/2020", description: "We are looking for front-end developers with an eye for details and in-depth knowledge of modern front-end technologies that are capable of creating state-of-the-art web apps on top of Wordpress starting with a custom design.", domain: "IT"),
        Job(id: 5, title: "Embedded Software Developer E-mobility", employer: "PREH ROMANIA", location: "Iasi", publishDate: "10/04/2020", description: "Since 1919 Preh has stood for technical innovation and SME-style flexibility. Having started out as specialists for radio and subsequently TV electronics, the company has evolved over decades into a global supplier and much sought OEM Partner in the automotive sector.", domain: "IT"),
        Job(id: 6, title: "Inginer chimist", employer: "S.C. Biofarm S.A.", location: "Bucuresti", publishDate: "15/04/2020", description: "Organizeaza si repartizeaza sarcinile pentru fiecare loc de munca din echipa pe care o coordoneaza;Asigura folosirea completa a capacitatilor de productie si a fondului de timp, utilizand la randament maxim utilajele prin eliminarea intreruperilor sau deficientelor in functionare, datorate activitatii coordonate;Urmareste, verifica si inregistreaza parametrii tehnologici ai echipamentelor in dosarul de serie pentru fiecare serie de produs;Raspunde de completarea corecta si in timp real a dosarelor de serie pentru fiecare serie de produs;Coordoneaza utilizarea in fabricatie a produselor intermediare corespunzatoare din punct de vedere calitativ si cantitativ;", domain: "Farma")
    ]
    
    static var appliances: [Int] = []
    
    static func getJobsWithAppliance() -> [Job] {
        var localjobs : [Job] = []
        for i in 0..<jobs.count {
            if appliances.contains(jobs[i].id){
                localjobs.append(jobs[i])
            }
        }
        return localjobs
    }
    
    static func getJobsWithoutAppliance() -> [Job] {
        var localjobs : [Job] = []
        for i in 0..<jobs.count {
            if !appliances.contains(jobs[i].id){
                localjobs.append(jobs[i])
            }
        }
        return localjobs
    }
    
    static var users: [User] = [
        User(id: 1, username: "employee1", password: "employee1pass", mail: "employee1@gmail.com", keywords: ["it", "relax", "team", "pharma"], cv: 1, userType: .employee),
        Employer(id: 2, username: "employer1", password: "employer1pass", mail: "employer1@gmail.com", keywords: [], cv: 0, name: "Inside Media Communication")
    ]
    
    static var loggedUserId = 1
    
    private static func getLoggedUserIndex() -> Int {
        for i in 0..<users.count {
            if users[i].id == loggedUserId {
                return i
            }
        }
        return -1
    }
    
    public static func getEmployerLoggedUserJobs() -> [Job] {
        let employer = getLoggedUser() as! Employer
        var employerJobs: [Job] = []
        for i in 0..<jobs.count {
            if jobs[i].employer == employer.name {
                employerJobs.append(jobs[i])
            }
        }
        return employerJobs
    }
    
    static func removeJob(identifier: Int) {
        for i in 0..<jobs.count {
            if jobs[i].id == identifier {
                jobs.remove(at: i)
                break
            }
        }
    }
    
    static func setLoggedUserPassword(newPassword: String) {
        users[getLoggedUserIndex()].password = newPassword
    }
    
    static func login(username: String, password: String) -> String {
        for i in 0..<users.count {
            if users[i].username == username {
                if users[i].password == password {
                    loggedUserId = users[i].id
                    if users[i].userType == .employer{
                        return "Employer"
                    }else {
                        return "Employee"
                    }
                }else {
                    continue
                }
            }else {
                continue
            }
        }
        return "Date de logare gresite!"
    }
    
    static func getLoggedUser() -> User {
        return users[getLoggedUserIndex()]
    }
    
    static func getLoggedUserKeywords() -> [String] {
        return users[getLoggedUserIndex()].keywords
    }
    
    static func removeLoggedUserKeyword(at index: Int){
        users[getLoggedUserIndex()].keywords.remove(at: index)
        
    }
    
    static func addLoggedUserKeyword(keyword: String){
        users[getLoggedUserIndex()].keywords.append(keyword)
    }
    
    private init(){
        
    }
}
